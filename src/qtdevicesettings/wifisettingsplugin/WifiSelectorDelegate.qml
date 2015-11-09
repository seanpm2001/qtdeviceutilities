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
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4
import com.theqtcompany.settings.common 1.0
import com.theqtcompany.settings.wifi 1.0

Item {
    id: root
    property bool checkable: true
    property bool checked: false
    property bool pressed: false
    signal clicked()

    MouseArea {
        id: delegateButton
        anchors.fill: parent
        hoverEnabled: true
        onPressed: root.pressed = true
        onClicked: root.clicked()
        onEntered: checked = !checked

        Rectangle {
            anchors.fill: parent
            color: root.checked ? Flat.FlatStyle.disabledColor : "transparent"
            opacity: root.checked ? 0.15 : 1.0
        }
        Rectangle {
            color: Flat.FlatStyle.darkFrameColor
            width: parent.width
            height: Flat.FlatStyle.onePixel
            anchors.bottom: parent.bottom
        }
        TextLabel {
            id: text
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.margins: Math.round(10 * Flat.FlatStyle.scaleFactor)
            horizontalAlignment: Text.AlignLeft
            text: modelData["ssid"]
        }
        WifiSignalMonitor {
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.margins: Math.round(10 * Flat.FlatStyle.scaleFactor)
            height: Math.round(parent.height * .8)
            width: height
            signalStrength: modelData["signalStrength"]
        }
    }
}
