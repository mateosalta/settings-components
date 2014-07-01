/*
 * Copyright 2013 Canonical Ltd.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors:
 *      Renato Araujo Oliveira Filho <renato@canonical.com>
 *      Olivier Tilloy <olivier.tilloy@canonical.com>
 */

import QtQuick 2.0
import Ubuntu.Components 0.1
import Ubuntu.Components.ListItems 0.1 as ListItem

ListItem.Standard {
    id: menu

    property alias count: label.text

    signal dismissed()

    iconSource: Qt.resolvedUrl("artwork/default_app.svg")

    control: UbuntuShape {
        height: label.height + units.gu(2)
        width: label.width + units.gu(2)
        color: Theme.palette.normal.backgroundText
        radius: "medium"

        Label {
            id: label
            objectName: "messageCount"

            anchors {
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter
            }
            horizontalAlignment: Text.AlignRight
            font.weight: Font.DemiBold
            fontSize: "medium"
            text: "0"

            color: Theme.palette.normal.foregroundText
        }

        Connections {
            target: menu.__mouseArea
            onClicked: {
                menu.clicked();
            }
        }
    }

    onItemRemoved: {
        menu.dismissed();
    }
}