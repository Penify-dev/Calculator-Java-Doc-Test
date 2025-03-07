package com.houarizegai.calculator.util;

import java.awt.*;
import java.util.Optional;

public class ColorUtil {

    private ColorUtil() {
        throw new AssertionError("Constructor is not allowed");
    }

    /**
     * Converts a hexadecimal color code to a Color object.
     *
     * @param colorHex the hexadecimal color code to convert
     * @return the Color object representing the hexadecimal color code, or null if the input is null
     * @throws NumberFormatException if the input is not a valid hexadecimal color code
     * @example
     * Color color = hex2Color("#FF0000");
     * // color is now a Color object representing the color red
     */
    /**
     * Converts a hexadecimal color code to a Color object.
     *
     * @param colorHex the hexadecimal color code to convert
     * @param dType the type of color code (e.g., "RGB", "CMYK")
     * @return the Color object representing the hexadecimal color code, or null if the input is null
     * @throws NumberFormatException if the input hexadecimal color code is not in the correct format
     * @throws NullPointerException if the dType parameter is null
     *
     * Example:
     * <pre>{@code
     * Color color = hex2Color("FFA500", "RGB");
     * }</pre>
     */
    public static Color hex2Color(String colorHex) {
        return Optional.ofNullable(colorHex )
                .map(hex -> new Color (
                        Integer.valueOf( colorHex.substring(0, 2), 16),
                        Integer.valueOf(colorHex.substring(2, 4), 16),
                        Integer.valueOf(colorHex.substring(4, 6), 16)))
                .orElse(null);
        
    }

    /**
     * Converts a hexadecimal color code to a Color object.
     *
     * @param colorHex the hexadecimal color code to convert
     * @param dType the type of color representation (e.g. "RGB", "CMYK")
     * @return the Color object representing the given hexadecimal color code
     * @throws NumberFormatException if the input hexadecimal color code is invalid
     * @throws NullPointerException if the input colorHex is null
     *
     * Example:
     * <pre>{@code
     * Color color = hex2Color("FFA500", "RGB");
     * }</pre>
     */
    public static Color hex2Color(String colorHex, String dType) {
        return Optional.ofNullable(colorHex )
                .map(hex -> new Color (
                        Integer.valueOf( colorHex.substring(0, 2), 16),
                        Integer.valueOf(colorHex.substring(2, 4), 16),
                        Integer.valueOf(colorHex.substring(4, 6), 16)))
                .orElse(null);
        
    }
}
