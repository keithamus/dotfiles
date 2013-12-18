/*global slate*/

/******************************/
/** Your common screen sizes **/
/******************************/

// full (the whole screen)
var full = slate.op('move', {
    x: 'screenOriginX',
    y: 'screenOriginY',
    width: 'screenSizeX',
    height: 'screenSizeY'
});
// leftHalf (fills up the left half of the screen)
var leftHalf = slate.op('move', {
    x: 'screenOriginX',
    y: 'screenOriginY',
    width: 'screenSizeX/2',
    height: 'screenSizeY'
});
// rightHalf (fills the right half of the screen)
var rightHalf = slate.op('move', {
    x: 'screenSizeX/2',
    y: 'screenOriginY',
    width: 'screenSizeX/2',
    height: 'screenSizeY'
});

/******************************/
/**   Auto Window Layouts    **/
/******************************/

// Mark here the windows you automatically want to be tiled. The first level
// properties need to be the application names, e.g "Google Chrome", the second
// level properties need to be the window titles (e.g "Developer Tools").
// When a new window of the App name and Window title is created, it will move
// to the layout you choose.
// If you set the window title to '*', that means any window title that isn't
// one of the others.
var autoWindowLayouts = {
    'iTerm': {
        // I want all iTerm windows to be on the right
        '*': rightHalf,
    },
    'Google Chrome': {
        // Developer tools on the right, all other chrome windows on the left
        'Developer Tools': rightHalf,
        '*': leftHalf,
    },
    'Sublime Text': {
        // Sublime text is always on the right
        '*': rightHalf,
    },
    'Console': {
        // Console.app on the left
        '*': leftHalf,
    },
    'HipChat': {
        // HipChat always on the right
        '*': rightHalf,
    },
    'Tweetbot': {
        // TweetBot always on the left
        '*': leftHalf,
    },
    'Skype': {
        // Skype always on the right
        '*': rightHalf,
    },
};

/************************/
/**   Shortcut Keys    **/
/************************/
slate.bindAll({
    // ⌘⌥→ to move the focussed window to the right hand side
    'right:alt;cmd': rightHalf,
    // ⌘⌥← to move the focussed window to the left hand side
    'left:alt;cmd': leftHalf,
    // ⌘⌥↑ to maximise the focussed window
    'up:alt;cmd': full,
});

// This function is the core of the auto-window-layouts
function autoLayoutWindow(event, window) {
    var app = typeof window.app === 'function' ? window.app() : window;
    window = window === app ? app.mainWindow() : window;
    var appName = app.name(),
        windowName = window.title();

    slate.log('Found app "' + appName + '" (' + windowName + ')');

    // Likely a modal or popup (e.g sublime text completions popup) - ignore these
    if (windowName === '' || !window.isResizable()) {
        return false;
    }

    if (autoWindowLayouts[appName] && autoWindowLayouts[appName][windowName]) {
        slate.log('Retiling "' + appName + '" (' + windowName + ')');
        window.doOperation(autoWindowLayouts[appName][windowName]);
    } else if (autoWindowLayouts[appName] && autoWindowLayouts[appName]['*']) {
        slate.log('Retiling "' + appName + '" (' + windowName + ') as *');
        window.doOperation(autoWindowLayouts[appName]['*']);
    }
}

slate.on('windowOpened', autoLayoutWindow);
slate.on('appOpened', autoLayoutWindow);

// Config's directive: config name value
// Default to the current screen if the screen the reference does not exist.
slate.config('defaultToCurrentScreen', true);
// The base value for nudge percent calculation
slate.config('nudgePercentOf', 'screenSize');
// The base value for resize percent calculation
slate.config('resizePercentOf', 'screenSize');
