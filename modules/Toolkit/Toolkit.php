<?php

namespace Toolkit;

use Titon\Io\Reader\JsonReader;
use Titon\Mvc\Application;
use Titon\Utility\Hash;
use Titon\Utility\Inflector;

class Toolkit {

    /**
     * Load the latest version from the master branch.
     *
     * @return string
     */
    public static function loadVersion() {
        return Application::getInstance()->get('cache')->store(__METHOD__, function() {
            return file_get_contents(VENDOR_DIR . 'titon/toolkit/version.md');
        });
    }

    /**
     * Load the component manifest from the master branch.
     *
     * @return array
     */
    public static function loadComponents() {
        return Application::getInstance()->get('cache')->store(__METHOD__, function() {
            $shapes = [
                '' => 'Square (Default)',
                'round' => 'Round',
                'pill' => 'Pill',
                'oval' => 'Oval',
                'skew' => 'Skew'
            ];

            $sizes = [
                'small' => 'Small',
                '' => 'Medium',
                'large' => 'Large'
            ];

            $states = [
                '' => 'Default',
                'is-info' => 'Info',
                'is-warning' => 'Warning',
                'is-success' => 'Success',
                'is-error' => 'Error'
            ];

            $effects = [
                '' => '-- None --',
                'visual-gloss' => 'Gloss',
                'visual-reflect' => 'Reflect',
                'visual-glare' => 'Glare',
                'visual-popout' => 'Popout'
            ];

            $json = (new JsonReader(VENDOR_DIR . 'titon/toolkit/manifest.json'))->read();
            $components = [];

            foreach ($json as $key => $component) {
                if (strpos($key, '-') === false) {
                    $key = str_replace('_', '-', Inflector::underscore($key));
                }

                $components[$key] = $component;
            }

            return Hash::merge($components, [
                'base' => [],
                'accordion' => [
                    'filters' => [
                        'mode' => ['title' => 'Mode', 'data' => ['click' => 'Click', 'hover' => 'Hover']],
                        'defaultIndex' => ['title' => 'Default Index', 'type' => 'number', 'default' => 0],
                        'multiple' => ['title' => 'Multiple?', 'type' => 'boolean'],
                        'collapsible' => ['title' => 'Collapsible?', 'type' => 'boolean']
                    ]
                ],
                'breadcrumb' => [
                    'filters' => [
                        'size' => ['title' => 'Size', 'data' => $sizes],
                    ]
                ],
                'button' => [
                    'filters' => [
                        'size' => ['title' => 'Size', 'data' => $sizes],
                        'state' => ['title' => 'State', 'data' => $states],
                        'shape' => ['title' => 'Shape', 'data' => $shapes],
                        'effect' => ['title' => 'Effect', 'data' => $effects],
                        'disabled' => ['title' => 'Disabled?', 'type' => 'boolean'],
                        'active' => ['title' => 'Active?', 'type' => 'boolean']
                    ]
                ],
                'button-group' => [
                    'filters' => [
                        'count' => ['title' => 'Count', 'type' => 'number', 'default' => 3],
                        'size' => ['title' => 'Size', 'data' => $sizes],
                        'state' => ['title' => 'State', 'data' => $states],
                        'shape' => ['title' => 'Shape', 'data' => $shapes],
                        'modifier' => ['title' => 'Modifier', 'data' => ['' => '-- None --', 'vertical' => 'Vertical', 'justified' => 'Justified']],
                        'disabled' => ['title' => 'Disabled?', 'type' => 'boolean'],
                        'active' => ['title' => 'Active?', 'type' => 'boolean']
                    ]
                ],
                'carousel' => [
                    'filters' => [
                        'animation' => ['title' => 'Animation', 'data' => [
                            'slide' => 'Slide',
                            'slide-up' => 'Slide Up',
                            'fade' => 'Fade'
                        ]],
                        'modifier' => ['title' => 'Modifier', 'data' => [
                            '' => 'Default (4:3)',
                            'wide' => 'Wide (16:9)',
                            'square' => 'Square (1:1)'
                        ], 'default' => ''],
                        'duration' => ['title' => 'Duration', 'type' => 'number', 'default' => 5000],
                        'autoCycle' => ['title' => 'Auto Cycle?', 'type' => 'boolean', 'default' => true],
                        'stopOnHover' => ['title' => 'Stop On Hover?', 'type' => 'boolean', 'default' => true],
                        'count' => ['title' => 'Count', 'type' => 'number', 'default' => 3],
                        'tabs' => ['title' => 'Show Tabs?', 'type' => 'boolean', 'default' => true],
                        'arrows' => ['title' => 'Show Arrows?', 'type' => 'boolean', 'default' => true],
                        'captions' => ['title' => 'Show Captions?', 'type' => 'boolean', 'default' => true]
                    ]
                ],
                'code' => [
                    'filters' => [
                        'modifier' => ['title' => 'Modifier', 'data' => ['' => '-- None --', 'scrollable' => 'Scrollable']]
                    ]
                ],
                'dropdown' => [
                    'filters' => [
                        'modifier' => ['title' => 'Modifier', 'data' => [
                            '' => '-- None --',
                            'top' => 'Top Align',
                            'right' => 'Right Align',
                            'left' => 'Left Align'
                        ]],
                        'align' => ['title' => 'Alignment', 'data' => [
                            '' => '-- None --',
                            'push-over' => 'Push Over (Horizontal)',
                            'pull-up' => 'Pull Up (Vertical)'
                        ]],
                        'mode' => ['title' => 'Mode', 'data' => ['click' => 'Click', 'hover' => 'Hover']],
                        'hideOpened' => ['title' => 'Hide Other Opened?', 'type' => 'boolean', 'default' => true]
                    ]
                ],
                'flyout' => [
                    'filters' => [
                        'className' => ['title' => 'Class', 'type' => 'text'],
                        'mode' => ['title' => 'Mode', 'data' => ['click' => 'Click', 'hover' => 'Hover'], 'default' => 'hover'],
                        'xOffset' => ['title' => 'X Offset', 'type' => 'number', 'default' => 0],
                        'yOffset' => ['title' => 'Y Offset', 'type' => 'number', 'default' => 0],
                        'showDelay' => ['title' => 'Hover Show Delay', 'type' => 'number', 'default' => 350],
                        'hideDelay' => ['title' => 'Hover Hide Delay', 'type' => 'number', 'default' => 500],
                        'itemLimit' => ['title' => 'Column Item Limit', 'type' => 'number', 'default' => 15],
                    ]
                ],
                'form' => [
                    'filters' => [
                        'size' => ['title' => 'Size', 'data' => $sizes],
                        'state' => ['title' => 'State', 'data' => ['' => 'Default', 'is-error' => 'Error', 'is-success' => 'Success']],
                        'required' => ['title' => 'Required?', 'type' => 'boolean', 'default' => false],
                        'disabled' => ['title' => 'Disabled?', 'type' => 'boolean', 'default' => false]
                    ]
                ],
                'grid' => [],
                'icon' => [
                    'filters' => [
                        'modifier' => ['title' => 'Modifier', 'data' => [
                            '' => '-- None --',
                            '90deg' => 'Rotate 90',
                            '180deg' => 'Rotate 180',
                            '270deg' => 'Rotate 270',
                            'rotate' => 'Rotate Animation',
                            'flip' => 'Flip Horizontal',
                            'flip-vert' => 'Flip Vertical'
                        ]]
                    ]
                ],
                'input' => [
                    'filters' => [
                        'checkbox' => ['title' => 'Checkbox?', 'type' => 'boolean', 'default' => true],
                        'radio' => ['title' => 'Radio?', 'type' => 'boolean', 'default' => true],
                        'select' => ['title' => 'Select?', 'type' => 'boolean', 'default' => true],
                        'disabled' => ['title' => 'Disabled?', 'type' => 'boolean', 'default' => false]
                    ]
                ],
                'input-group' => [
                    'filters' => [
                        'round' => ['title' => 'Round?', 'type' => 'boolean']
                    ]
                ],
                'label' => [
                    'filters' => [
                        'size' => ['title' => 'Size', 'data' => $sizes],
                        'state' => ['title' => 'State', 'data' => $states],
                        'modifier' => ['title' => 'Modifier', 'data' => [
                            '' => '-- None --',
                            'badge' => 'Badge',
                            'arrow-left' => 'Left Arrow',
                            'arrow-right' => 'Right Arrow',
                            'ribbon-left' => 'Left Ribbon',
                            'ribbon-right' => 'Right Ribbon'
                        ]]
                    ]
                ],
                'lazy-load' => [
                    'filters' => [
                        'delay' => ['title' => 'Force Delay', 'type' => 'number', 'default' => 10000],
                        'threshold' => ['title' => 'Threshold', 'type' => 'number', 'default' => 150],
                        'throttle' => ['title' => 'Throttle', 'type' => 'number', 'default' => 50],
                        'forceLoad' => ['title' => 'Force load?', 'type' => 'boolean']
                    ]
                ],
                'matrix' => [
                    'filters' => [
                        'mode' => ['title' => 'Mode', 'data' => ['single' => 'Single', 'multiple' => 'Multiple']],
                        'gutter' => ['title' => 'Gutter', 'type' => 'number', 'default' => 20],
                        'rtl' => ['title' => 'Right to left?', 'type' => 'boolean'],
                        'defer' => ['title' => 'Defer for images?', 'type' => 'boolean', 'default' => true]
                    ]
                ],
                'modal' => [
                    'filters' => [
                        'className' => ['title' => 'Class', 'type' => 'text'],
                        'animation' => ['title' => 'Animation', 'data' => [
                            'fade' => 'Fade',
                            'from-above' => 'From Above',
                            'from-below' => 'From Below',
                            'slide-in-top' => 'Slide In Top',
                            'slide-in-right' => 'Slide In Right',
                            'slide-in-bottom' => 'Slide In Bottom',
                            'slide-in-left' => 'Slide In Left',
                            'sticky-top' => 'Sticky Top',
                            'sticky-right' => 'Sticky Right',
                            'sticky-bottom' => 'Sticky Bottom',
                            'sticky-left' => 'Sticky Left',
                            'flip' => 'Flip',
                            'flip-vert' => 'Flip Vertical'
                        ]],
                        'ajax' => ['title' => 'Is AJAX?', 'type' => 'boolean', 'default' => true],
                        'draggable' => ['title' => 'Is draggable?', 'type' => 'boolean', 'default' => false],
                        'fullScreen' => ['title' => 'Full screen?', 'type' => 'boolean', 'default' => false],
                        'blackout' => ['title' => 'Show blackout?', 'type' => 'boolean', 'default' => true],
                        'showLoading' => ['title' => 'Show loading?', 'type' => 'boolean', 'default' => true],
                    ]
                ],
                'notice' => [
                    'filters' => [
                        'state' => ['title' => 'State', 'data' => $states],
                        'round' => ['title' => 'Round?', 'type' => 'boolean']
                    ]
                ],
                'pagination' => [
                    'filters' => [
                        'modifier' => ['title' => 'Modifier', 'data' => ['' => '-- None --', 'grouped' => 'Grouped']],
                        'size' => ['title' => 'Size', 'data' => $sizes],
                        'state' => ['title' => 'State', 'data' => $states],
                        'shape' => ['title' => 'Shape (Grouped)', 'data' => $shapes],
                        'count' => ['title' => 'Count', 'type' => 'number', 'default' => 5],
                    ]
                ],
                'pin' => [
                    'filters' => [
                        'animation' => ['title' => 'Animation', 'data' => ['' => '-- None --', 'sticky' => 'Sticky', 'slide' => 'Slide']],
                        'location' => ['title' => 'Location', 'data' => ['right' => 'Right', 'left' => 'Left'], 'default' => 'right'],
                        'xOffset' => ['title' => 'X Offset', 'type' => 'number', 'default' => 0],
                        'yOffset' => ['title' => 'Y Offset', 'type' => 'number', 'default' => 0],
                        'throttle' => ['title' => 'Throttle', 'type' => 'number', 'default' => 50],
                        'fixed' => ['title' => 'Fixed?', 'type' => 'boolean', 'default' => false],
                        'height' => ['title' => 'Default Height', 'type' => 'number'],
                        'top' => ['title' => 'Default Top', 'type' => 'number']
                    ]
                ],
                'popover' => [
                    'filters' => [
                        'className' => ['title' => 'Class', 'type' => 'text'],
                        'animation' => ['title' => 'Animation', 'data' => [
                            '' => '-- None -- ',
                            'fade' => 'Fade',
                            'from-above' => 'From Above',
                            'from-below' => 'From Below',
                            'flip-rotate' => 'Flip Rotate',
                            'slide-in' => 'Slide In'
                        ]],
                        'position' => ['title' => 'Position', 'data' => [
                            'topLeft' => 'Top Left',
                            'topCenter' => 'Top Center',
                            'topRight' => 'Top Right',
                            'centerLeft' => 'Center Left',
                            'centerRight' => 'Center Right',
                            'bottomLeft' => 'Bottom Left',
                            'bottomCenter' => 'Bottom Center',
                            'bottomRight' => 'Bottom Right'
                        ], 'default' => 'topRight'],
                        'xOffset' => ['title' => 'X Offset', 'type' => 'number', 'default' => 0],
                        'yOffset' => ['title' => 'Y Offset', 'type' => 'number', 'default' => 0],
                        'delay' => ['title' => 'Delay', 'type' => 'number', 'default' => 0],
                        'ajax' => ['title' => 'Is AJAX?', 'type' => 'boolean', 'default' => false],
                        'showLoading' => ['title' => 'Show loading?', 'type' => 'boolean', 'default' => true],
                        'showTitle' => ['title' => 'Show title?', 'type' => 'boolean', 'default' => true],
                    ]
                ],
                'progress' => [
                    'filters' => [
                        'size' => ['title' => 'Size', 'data' => $sizes],
                        'state' => ['title' => 'State', 'data' => $states],
                        'shape' => ['title' => 'Shape', 'data' => [
                            '' => 'Square (Default)',
                            'round' => 'Round',
                            'pill' => 'Pill'
                        ]],
                        'width' => ['title' => 'Width', 'type' => 'number', 'default' => 55]
                    ]
                ],
                'responsive' => [],
                'showcase' => [
                    'filters' => [
                        'className' => ['title' => 'Class', 'type' => 'text'],
                        'gutter' => ['title' => 'Gutter Margin', 'type' => 'number', 'default' => 50],
                        'blackout' => ['title' => 'Show blackout?', 'type' => 'boolean', 'default' => true],
                        'group' => ['title' => 'Grouped?', 'type' => 'boolean', 'default' => true],
                        'count' => ['title' => 'Count', 'type' => 'number', 'default' => 5]
                    ]
                ],
                'stalker' => [
                    'filters' => [
                        'threshold' => ['title' => 'Threshold', 'type' => 'number', 'default' => 50],
                        'throttle' => ['title' => 'Throttle', 'type' => 'number', 'default' => 50],
                        'applyToParent' => ['title' => 'Apply active to parent?', 'type' => 'boolean', 'default' => true],
                        'onlyWithin' => ['title' => 'Only within marker?', 'type' => 'boolean', 'default' => true],
                    ]
                ],
                'table' => [
                    'filters' => [
                        'size' => ['title' => 'Size', 'data' => $sizes],
                        'hover' => ['title' => 'Show hover?', 'type' => 'boolean', 'default' => false],
                        'sortable' => ['title' => 'Sortable headers?', 'type' => 'boolean', 'default' => false],
                        'count' => ['title' => 'Count', 'type' => 'number', 'default' => 25]
                    ]
                ],
                'tabs' => [
                    'filters' => [
                        'mode' => ['title' => 'Mode', 'data' => ['click' => 'Click', 'hover' => 'Hover'], 'default' => 'click'],
                        'defaultIndex' => ['title' => 'Default Index', 'type' => 'number', 'default' => 0],
                        'cookie' => ['title' => 'Cookie Name', 'type' => 'text'],
                        'cookieDuration' => ['title' => 'Cookie Duration', 'type' => 'number', 'default' => 30],
                        'ajax' => ['title' => 'Allow AJAX?', 'type' => 'boolean', 'default' => true],
                        'collapsible' => ['title' => 'Collapsible?', 'type' => 'boolean', 'default' => false],
                        'persistState' => ['title' => 'Persist state?', 'type' => 'boolean', 'default' => false],
                        'loadFragment' => ['title' => 'Load from fragment?', 'type' => 'boolean', 'default' => true],
                        'preventDefault' => ['title' => 'Prevent default?', 'type' => 'boolean', 'default' => true],
                    ]
                ],
                'tooltip' => [
                    'filters' => [
                        'className' => ['title' => 'Class', 'type' => 'text'],
                        'animation' => ['title' => 'Animation', 'data' => [
                            '' => '-- None -- ',
                            'fade' => 'Fade',
                            'from-above' => 'From Above',
                            'from-below' => 'From Below',
                            'flip-rotate' => 'Flip Rotate',
                            'slide-in' => 'Slide In'
                        ]],
                        'position' => ['title' => 'Position', 'data' => [
                            'topLeft' => 'Top Left',
                            'topCenter' => 'Top Center',
                            'topRight' => 'Top Right',
                            'centerLeft' => 'Center Left',
                            'centerRight' => 'Center Right',
                            'bottomLeft' => 'Bottom Left',
                            'bottomCenter' => 'Bottom Center',
                            'bottomRight' => 'Bottom Right'
                        ], 'default' => 'topCenter'],
                        'mode' => ['title' => 'Mode', 'data' => ['click' => 'Click', 'hover' => 'Hover'], 'default' => 'hover'],
                        'mouseThrottle' => ['title' => 'Mouse Throttle', 'type' => 'number', 'default' => 50],
                        'xOffset' => ['title' => 'X Offset', 'type' => 'number', 'default' => 0],
                        'yOffset' => ['title' => 'Y Offset', 'type' => 'number', 'default' => 0],
                        'delay' => ['title' => 'Delay', 'type' => 'number', 'default' => 0],
                        'ajax' => ['title' => 'Is AJAX?', 'type' => 'boolean', 'default' => false],
                        'follow' => ['title' => 'Follow mouse?', 'type' => 'boolean', 'default' => false],
                        'showLoading' => ['title' => 'Show loading?', 'type' => 'boolean', 'default' => true],
                        'showTitle' => ['title' => 'Show title?', 'type' => 'boolean', 'default' => true],
                    ]
                ],
                'type-ahead' => [
                    'filters' => [
                        'className' => ['title' => 'Class', 'type' => 'text'],
                        'minLength' => ['title' => 'Minimum Characters', 'type' => 'number', 'default' => 1],
                        'itemLimit' => ['title' => 'Item Limit', 'type' => 'number', 'default' => 15],
                        'throttle' => ['title' => 'Lookup Throttle', 'type' => 'number', 'default' => 250],
                        'prefetch' => ['title' => 'Prefetch lookup?', 'type' => 'boolean', 'default' => false],
                        'shadow' => ['title' => 'Shadow text?', 'type' => 'boolean', 'default' => false],
                    ]
                ],
            ]);
        });
    }

}