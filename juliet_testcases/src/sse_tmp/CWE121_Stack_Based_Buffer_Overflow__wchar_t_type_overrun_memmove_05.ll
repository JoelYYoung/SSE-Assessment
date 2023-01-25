; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i32], i8*, i8* }

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [32 x i32] [i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !13
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_05_bad() #0 !dbg !22 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  %0 = load i32, i32* @staticTrue, align 4, !dbg !25
  %tobool = icmp ne i32 %0, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !28, metadata !DIExpression()), !dbg !40
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !41
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !42
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !43
  %1 = load i8*, i8** %voidSecond1, align 8, !dbg !43
  %2 = bitcast i8* %1 to i32*, !dbg !44
  call void @printWLine(i32* %2), !dbg !45
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !46
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !47
  %3 = bitcast i32* %arraydecay to i8*, !dbg !47
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %3, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 80, i1 false), !dbg !47
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !48
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst2, i64 0, i64 15, !dbg !49
  store i32 0, i32* %arrayidx, align 4, !dbg !50
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !51
  %arraydecay4 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 0, !dbg !52
  call void @printWLine(i32* %arraydecay4), !dbg !53
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !54
  %4 = load i8*, i8** %voidSecond5, align 8, !dbg !54
  %5 = bitcast i8* %4 to i32*, !dbg !55
  call void @printWLine(i32* %5), !dbg !56
  br label %if.end, !dbg !57

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @printWLine(i32*) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_05_good() #0 !dbg !59 {
entry:
  call void @good1(), !dbg !60
  call void @good2(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #5, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #5, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_05_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  call void @CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_05_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !83 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  %0 = load i32, i32* @staticFalse, align 4, !dbg !84
  %tobool = icmp ne i32 %0, 0, !dbg !84
  br i1 %tobool, label %if.then, label %if.else, !dbg !86

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !87
  br label %if.end, !dbg !89

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !90, metadata !DIExpression()), !dbg !93
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !94
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !95
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !96
  %1 = load i8*, i8** %voidSecond1, align 8, !dbg !96
  %2 = bitcast i8* %1 to i32*, !dbg !97
  call void @printWLine(i32* %2), !dbg !98
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !99
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !100
  %3 = bitcast i32* %arraydecay to i8*, !dbg !100
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %3, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !100
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !101
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst2, i64 0, i64 15, !dbg !102
  store i32 0, i32* %arrayidx, align 4, !dbg !103
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !104
  %arraydecay4 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 0, !dbg !105
  call void @printWLine(i32* %arraydecay4), !dbg !106
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !107
  %4 = load i8*, i8** %voidSecond5, align 8, !dbg !107
  %5 = bitcast i8* %4 to i32*, !dbg !108
  call void @printWLine(i32* %5), !dbg !109
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !111 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  %0 = load i32, i32* @staticTrue, align 4, !dbg !112
  %tobool = icmp ne i32 %0, 0, !dbg !112
  br i1 %tobool, label %if.then, label %if.end, !dbg !114

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !115, metadata !DIExpression()), !dbg !118
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !119
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !120
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !121
  %1 = load i8*, i8** %voidSecond1, align 8, !dbg !121
  %2 = bitcast i8* %1 to i32*, !dbg !122
  call void @printWLine(i32* %2), !dbg !123
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !124
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !125
  %3 = bitcast i32* %arraydecay to i8*, !dbg !125
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %3, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !125
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !126
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst2, i64 0, i64 15, !dbg !127
  store i32 0, i32* %arrayidx, align 4, !dbg !128
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !129
  %arraydecay4 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 0, !dbg !130
  call void @printWLine(i32* %arraydecay4), !dbg !131
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !132
  %4 = load i8*, i8** %voidSecond5, align 8, !dbg !132
  %5 = bitcast i8* %4 to i32*, !dbg !133
  call void @printWLine(i32* %5), !dbg !134
  br label %if.end, !dbg !135

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !136
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !15, line: 35, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !9, line: 74, baseType: !10)
!9 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0, !13}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !15, line: 36, type: !10, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_05.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_05_bad", scope: !15, file: !15, line: 40, type: !23, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocation(line: 42, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 42, column: 8)
!27 = !DILocation(line: 42, column: 8, scope: !22)
!28 = !DILocalVariable(name: "structCharVoid", scope: !29, file: !15, line: 45, type: !31)
!29 = distinct !DILexicalBlock(scope: !30, file: !15, line: 44, column: 9)
!30 = distinct !DILexicalBlock(scope: !26, file: !15, line: 43, column: 5)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !15, line: 30, baseType: !32)
!32 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_charVoid", file: !15, line: 25, size: 640, elements: !33)
!33 = !{!34, !38, !39}
!34 = !DIDerivedType(tag: DW_TAG_member, name: "charFirst", scope: !32, file: !15, line: 27, baseType: !35, size: 512)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 512, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 16)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "voidSecond", scope: !32, file: !15, line: 28, baseType: !6, size: 64, offset: 512)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "voidThird", scope: !32, file: !15, line: 29, baseType: !6, size: 64, offset: 576)
!40 = !DILocation(line: 45, column: 22, scope: !29)
!41 = !DILocation(line: 46, column: 28, scope: !29)
!42 = !DILocation(line: 46, column: 39, scope: !29)
!43 = !DILocation(line: 48, column: 50, scope: !29)
!44 = !DILocation(line: 48, column: 24, scope: !29)
!45 = !DILocation(line: 48, column: 13, scope: !29)
!46 = !DILocation(line: 50, column: 36, scope: !29)
!47 = !DILocation(line: 50, column: 13, scope: !29)
!48 = !DILocation(line: 51, column: 28, scope: !29)
!49 = !DILocation(line: 51, column: 13, scope: !29)
!50 = !DILocation(line: 51, column: 92, scope: !29)
!51 = !DILocation(line: 52, column: 50, scope: !29)
!52 = !DILocation(line: 52, column: 35, scope: !29)
!53 = !DILocation(line: 52, column: 13, scope: !29)
!54 = !DILocation(line: 53, column: 50, scope: !29)
!55 = !DILocation(line: 53, column: 24, scope: !29)
!56 = !DILocation(line: 53, column: 13, scope: !29)
!57 = !DILocation(line: 55, column: 5, scope: !30)
!58 = !DILocation(line: 56, column: 1, scope: !22)
!59 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_05_good", scope: !15, file: !15, line: 105, type: !23, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!60 = !DILocation(line: 107, column: 5, scope: !59)
!61 = !DILocation(line: 108, column: 5, scope: !59)
!62 = !DILocation(line: 109, column: 1, scope: !59)
!63 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 120, type: !64, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!64 = !DISubroutineType(types: !65)
!65 = !{!10, !10, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !15, line: 120, type: !10)
!70 = !DILocation(line: 120, column: 14, scope: !63)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !15, line: 120, type: !66)
!72 = !DILocation(line: 120, column: 27, scope: !63)
!73 = !DILocation(line: 123, column: 22, scope: !63)
!74 = !DILocation(line: 123, column: 12, scope: !63)
!75 = !DILocation(line: 123, column: 5, scope: !63)
!76 = !DILocation(line: 125, column: 5, scope: !63)
!77 = !DILocation(line: 126, column: 5, scope: !63)
!78 = !DILocation(line: 127, column: 5, scope: !63)
!79 = !DILocation(line: 130, column: 5, scope: !63)
!80 = !DILocation(line: 131, column: 5, scope: !63)
!81 = !DILocation(line: 132, column: 5, scope: !63)
!82 = !DILocation(line: 134, column: 5, scope: !63)
!83 = distinct !DISubprogram(name: "good1", scope: !15, file: !15, line: 63, type: !23, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!84 = !DILocation(line: 65, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !83, file: !15, line: 65, column: 8)
!86 = !DILocation(line: 65, column: 8, scope: !83)
!87 = !DILocation(line: 68, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !15, line: 66, column: 5)
!89 = !DILocation(line: 69, column: 5, scope: !88)
!90 = !DILocalVariable(name: "structCharVoid", scope: !91, file: !15, line: 73, type: !31)
!91 = distinct !DILexicalBlock(scope: !92, file: !15, line: 72, column: 9)
!92 = distinct !DILexicalBlock(scope: !85, file: !15, line: 71, column: 5)
!93 = !DILocation(line: 73, column: 22, scope: !91)
!94 = !DILocation(line: 74, column: 28, scope: !91)
!95 = !DILocation(line: 74, column: 39, scope: !91)
!96 = !DILocation(line: 76, column: 50, scope: !91)
!97 = !DILocation(line: 76, column: 24, scope: !91)
!98 = !DILocation(line: 76, column: 13, scope: !91)
!99 = !DILocation(line: 78, column: 36, scope: !91)
!100 = !DILocation(line: 78, column: 13, scope: !91)
!101 = !DILocation(line: 79, column: 28, scope: !91)
!102 = !DILocation(line: 79, column: 13, scope: !91)
!103 = !DILocation(line: 79, column: 92, scope: !91)
!104 = !DILocation(line: 80, column: 50, scope: !91)
!105 = !DILocation(line: 80, column: 35, scope: !91)
!106 = !DILocation(line: 80, column: 13, scope: !91)
!107 = !DILocation(line: 81, column: 50, scope: !91)
!108 = !DILocation(line: 81, column: 24, scope: !91)
!109 = !DILocation(line: 81, column: 13, scope: !91)
!110 = !DILocation(line: 84, column: 1, scope: !83)
!111 = distinct !DISubprogram(name: "good2", scope: !15, file: !15, line: 87, type: !23, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!112 = !DILocation(line: 89, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !111, file: !15, line: 89, column: 8)
!114 = !DILocation(line: 89, column: 8, scope: !111)
!115 = !DILocalVariable(name: "structCharVoid", scope: !116, file: !15, line: 92, type: !31)
!116 = distinct !DILexicalBlock(scope: !117, file: !15, line: 91, column: 9)
!117 = distinct !DILexicalBlock(scope: !113, file: !15, line: 90, column: 5)
!118 = !DILocation(line: 92, column: 22, scope: !116)
!119 = !DILocation(line: 93, column: 28, scope: !116)
!120 = !DILocation(line: 93, column: 39, scope: !116)
!121 = !DILocation(line: 95, column: 50, scope: !116)
!122 = !DILocation(line: 95, column: 24, scope: !116)
!123 = !DILocation(line: 95, column: 13, scope: !116)
!124 = !DILocation(line: 97, column: 36, scope: !116)
!125 = !DILocation(line: 97, column: 13, scope: !116)
!126 = !DILocation(line: 98, column: 28, scope: !116)
!127 = !DILocation(line: 98, column: 13, scope: !116)
!128 = !DILocation(line: 98, column: 92, scope: !116)
!129 = !DILocation(line: 99, column: 50, scope: !116)
!130 = !DILocation(line: 99, column: 35, scope: !116)
!131 = !DILocation(line: 99, column: 13, scope: !116)
!132 = !DILocation(line: 100, column: 50, scope: !116)
!133 = !DILocation(line: 100, column: 24, scope: !116)
!134 = !DILocation(line: 100, column: 13, scope: !116)
!135 = !DILocation(line: 102, column: 5, scope: !117)
!136 = !DILocation(line: 103, column: 1, scope: !111)
