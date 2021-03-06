/*
 *  Cascade Image Editor
 *
 *  Copyright (C) 2020 The Cascade developers
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

#include "colorbuttonentity.h"
#include "ui_colorbuttonentity.h"

#include "nodeproperties.h"

ColorButtonEntity::ColorButtonEntity(UIElementType et, QWidget *parent) :
    UiEntity(et, parent),
    ui(new Ui::ColorButtonEntity)
{
    ui->setupUi(this);

    connect(ui->colorButton, &ColorButton::colorChanged,
                this, &ColorButtonEntity::handleColorChanged);
}

QColor ColorButtonEntity::getColor()
{
    return ui->colorButton->getColor();
}

void ColorButtonEntity::setColor(QColor c)
{
    ui->colorButton->setColor(c);
}

void ColorButtonEntity::setName(const QString &s)
{
    ui->label->setText(s);
}

void ColorButtonEntity::handleColorChanged(QColor c)
{
    emit valueChanged(c);
}

QString ColorButtonEntity::getValuesAsString()
{
    QString s;
    s.append(QString::number(getColor().red()));
    s.append(",");
    s.append(QString::number(getColor().green()));
    s.append(",");
    s.append(QString::number(getColor().blue()));
    // Omitting alpha

    return s;
}

void ColorButtonEntity::selfConnectToValueChanged(NodeProperties *p)
{
    connect(this, &ColorButtonEntity::valueChanged,
            p, [p]{p->handleSomeValueChanged();});
}

ColorButtonEntity::~ColorButtonEntity()
{
    delete ui;
}
