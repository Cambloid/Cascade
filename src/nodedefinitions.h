#ifndef NODEDEFINITIONS_H
#define NODEDEFINITIONS_H

#include <stdexcept>

#include <QMap>

namespace Cascade
{
    // Global node types
    enum NodeType
    {
        NODE_TYPE_READ,
        NODE_TYPE_BLUR,
        NODE_TYPE_MAX
    };

    const QMap<NodeType, QString> nodeStrings =
    {
        { NODE_TYPE_READ, "Read" },
        { NODE_TYPE_BLUR, "Blur" }
    };

    // Global input types
    enum NodeInputType
    {
        NODE_INPUT_TYPE_NONE,
        NODE_INPUT_TYPE_RGB_FRONT,
        NODE_INPUT_TYPE_RGB_BACK,
        NODE_INPUT_TYPE_ALPHA
    };

    // Global output types
    enum NodeOutputType
    {
        NODE_OUTPUT_TYPE_RGB
    };

    // Global UI element types
    enum UIElementType
    {
        UI_ELEMENT_TYPE_PROPERTIES_HEADING,
        UI_ELEMENT_TYPE_SLIDERSPIN_INT,
        UI_ELEMENT_TYPE_SLIDERSPIN_DOUBLE,
        UI_ELEMENT_TYPE_FILEBOX
    };

    /////////////////////////////////////

    struct NodeInitProperties
    {
        NodeType nodeType;
        QString title;
        std::vector<NodeInputType> nodeInputs;
        std::vector<NodeOutputType> nodeOutputs;
        QMap<UIElementType, QString> uiElements;
        QString shaderPath;
    };

    /////////////////////////////////////

    const NodeInitProperties readNodeInitProperties =
    {
        NODE_TYPE_READ,
        "Read",
        { },
        { NODE_OUTPUT_TYPE_RGB },
        {
            { UI_ELEMENT_TYPE_PROPERTIES_HEADING, "Read"},
            { UI_ELEMENT_TYPE_FILEBOX, ""}
        },
        ":/shaders/noop_comp.spv"
    };

    const NodeInitProperties blurNodeInitProperties =
    {
        NODE_TYPE_BLUR,
        "Blur",
        { NODE_INPUT_TYPE_RGB_BACK },
        { NODE_OUTPUT_TYPE_RGB },
        {
            { UI_ELEMENT_TYPE_PROPERTIES_HEADING, "Blur"},
            { UI_ELEMENT_TYPE_SLIDERSPIN_INT, "Strength,0,100,1,3"}
        },
        ":/shaders/blur_test_comp.spv"
    };

    static NodeInitProperties getPropertiesForType(const NodeType t)
    {
        if(t == NODE_TYPE_READ)
        {
            return readNodeInitProperties;
        }
        else if(t == NODE_TYPE_BLUR)
        {
            return blurNodeInitProperties;
        }
        throw std::runtime_error("Node type not found.");
    }
}

#endif // NODEDEFINITIONS_H
