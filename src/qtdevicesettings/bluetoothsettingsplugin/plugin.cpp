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

#include <QtQml/QQmlExtensionPlugin>
#include <QtQml/qqml.h>
#include <qcoreapplication.h>
#include <QQmlEngine>
#include <QQmlContext>

#include "bluetoothdevice.h"
#include "discoverymodel.h"

class BluetoothSettingsQmlPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QQmlExtensionInterface")

public:
    void registerTypes(const char *uri)
    {
        Q_ASSERT(QLatin1String(uri) == QLatin1String("com.theqtcompany.settings.bluetooth"));
        qmlRegisterUncreatableType<BtDeviceItem>(uri, 1, 0, "BtDeviceItem", "Cannot be instantiated directly.");
        const QString prefix = "qrc:";
        qmlRegisterType(QUrl(prefix + "Bluetooth.qml"), uri, 1, 0, "Bluetooth");
        qmlRegisterType(QUrl(prefix + "Discovery.qml"), uri, 1, 0, "Discovery");

    }

    void initializeEngine(QQmlEngine * engine, const char * uri)
    {
        Q_ASSERT(QLatin1String(uri) == QLatin1String("com.theqtcompany.settings.bluetooth"));
        BluetoothDevice *device = new BluetoothDevice(engine);
        engine->rootContext()->setContextProperty("BtDevice", device);
    }
};

#include "plugin.moc"
