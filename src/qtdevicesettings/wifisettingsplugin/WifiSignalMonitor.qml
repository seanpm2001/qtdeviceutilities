/****************************************************************************
**
** Copyright (C) 2015 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the Qt Device Utilities module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL3$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see http://www.qt.io/terms-conditions. For further
** information use the contact form at http://www.qt.io/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 3 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPLv3 included in the
** packaging of this file. Please review the following information to
** ensure the GNU Lesser General Public License version 3 requirements
** will be met: https://www.gnu.org/licenses/lgpl.html.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 2.0 or later as published by the Free
** Software Foundation and appearing in the file LICENSE.GPL included in
** the packaging of this file. Please review the following information to
** ensure the GNU General Public License version 2.0 requirements will be
** met: http://www.gnu.org/licenses/gpl-2.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/
import QtQuick 2.5

Item {
    id: root

    property bool scanning: false
    property int signalStrength: 100
    property bool connected: false

    onSignalStrengthChanged: {
        sprite.visible = true;

        if (signalStrength < 10) {
            sprite.visible = false;
        }
        else if (signalStrength < 30) {
            sprite.currentFrame = 0;
        }
        else if (signalStrength < 60) {
            sprite.currentFrame = 1;
        }
        else if (signalStrength < 80) {
            sprite.currentFrame = 2;
        }
        else if (signalStrength <= 100) {
            sprite.currentFrame = 3;
        }
    }

    Image {
        anchors.fill: parent
        source: "../icons/Wifi_lightgray_2x.png"
    }

    AnimatedSprite {
        id: sprite
        anchors.fill: parent
        source: connected ? "../icons/WifiAnim_qt_2x.png" : "../icons/WifiAnim_black_2x.png"
        frameDuration: 500
        frameCount: 4
        currentFrame: 3
        frameSync: false
        frameWidth: 32
        frameHeight: 32
        loops: 40
        running: scanning
    }
}
