; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_09.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_09.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_TRUE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external dso_local constant i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_09_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !27
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !28
  store i32 0, i32* %arrayidx, align 4, !dbg !29
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !30
  %tobool = icmp ne i32 %0, 0, !dbg !30
  br i1 %tobool, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !33
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !35
  store i32* %add.ptr, i32** %data, align 8, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !38, metadata !DIExpression()), !dbg !40
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !41
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !42
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !43
  store i32 0, i32* %arrayidx4, align 4, !dbg !44
  %1 = load i32*, i32** %data, align 8, !dbg !45
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !46
  %call6 = call i32* @wcsncpy(i32* %1, i32* %arraydecay5, i64 99) #4, !dbg !47
  %2 = load i32*, i32** %data, align 8, !dbg !48
  %arrayidx7 = getelementptr inbounds i32, i32* %2, i64 99, !dbg !48
  store i32 0, i32* %arrayidx7, align 4, !dbg !49
  %3 = load i32*, i32** %data, align 8, !dbg !50
  call void @printWLine(i32* %3), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_09_good() #0 !dbg !53 {
entry:
  call void @goodG2B1(), !dbg !54
  call void @goodG2B2(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* null) #4, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #4, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_09_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_09_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !77 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !82
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !83
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !84
  store i32 0, i32* %arrayidx, align 4, !dbg !85
  %0 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !86
  %tobool = icmp ne i32 %0, 0, !dbg !86
  br i1 %tobool, label %if.then, label %if.else, !dbg !88

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !89
  br label %if.end, !dbg !91

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !92
  store i32* %arraydecay1, i32** %data, align 8, !dbg !94
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !95, metadata !DIExpression()), !dbg !97
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !98
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !99
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !100
  store i32 0, i32* %arrayidx4, align 4, !dbg !101
  %1 = load i32*, i32** %data, align 8, !dbg !102
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !103
  %call6 = call i32* @wcsncpy(i32* %1, i32* %arraydecay5, i64 99) #4, !dbg !104
  %2 = load i32*, i32** %data, align 8, !dbg !105
  %arrayidx7 = getelementptr inbounds i32, i32* %2, i64 99, !dbg !105
  store i32 0, i32* %arrayidx7, align 4, !dbg !106
  %3 = load i32*, i32** %data, align 8, !dbg !107
  call void @printWLine(i32* %3), !dbg !108
  ret void, !dbg !109
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !110 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !115
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !116
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !117
  store i32 0, i32* %arrayidx, align 4, !dbg !118
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !119
  %tobool = icmp ne i32 %0, 0, !dbg !119
  br i1 %tobool, label %if.then, label %if.end, !dbg !121

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !122
  store i32* %arraydecay1, i32** %data, align 8, !dbg !124
  br label %if.end, !dbg !125

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !126, metadata !DIExpression()), !dbg !128
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !129
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !130
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !131
  store i32 0, i32* %arrayidx4, align 4, !dbg !132
  %1 = load i32*, i32** %data, align 8, !dbg !133
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !134
  %call6 = call i32* @wcsncpy(i32* %1, i32* %arraydecay5, i64 99) #4, !dbg !135
  %2 = load i32*, i32** %data, align 8, !dbg !136
  %arrayidx7 = getelementptr inbounds i32, i32* %2, i64 99, !dbg !136
  store i32 0, i32* %arrayidx7, align 4, !dbg !137
  %3 = load i32*, i32** %data, align 8, !dbg !138
  call void @printWLine(i32* %3), !dbg !139
  ret void, !dbg !140
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_09.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_09_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_09.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 26, column: 13, scope: !11)
!26 = !DILocation(line: 27, column: 13, scope: !11)
!27 = !DILocation(line: 27, column: 5, scope: !11)
!28 = !DILocation(line: 28, column: 5, scope: !11)
!29 = !DILocation(line: 28, column: 23, scope: !11)
!30 = !DILocation(line: 29, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 8)
!32 = !DILocation(line: 29, column: 8, scope: !11)
!33 = !DILocation(line: 32, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !12, line: 30, column: 5)
!35 = !DILocation(line: 32, column: 27, scope: !34)
!36 = !DILocation(line: 32, column: 14, scope: !34)
!37 = !DILocation(line: 33, column: 5, scope: !34)
!38 = !DILocalVariable(name: "source", scope: !39, file: !12, line: 35, type: !22)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!40 = !DILocation(line: 35, column: 17, scope: !39)
!41 = !DILocation(line: 36, column: 17, scope: !39)
!42 = !DILocation(line: 36, column: 9, scope: !39)
!43 = !DILocation(line: 37, column: 9, scope: !39)
!44 = !DILocation(line: 37, column: 23, scope: !39)
!45 = !DILocation(line: 39, column: 17, scope: !39)
!46 = !DILocation(line: 39, column: 23, scope: !39)
!47 = !DILocation(line: 39, column: 9, scope: !39)
!48 = !DILocation(line: 41, column: 9, scope: !39)
!49 = !DILocation(line: 41, column: 21, scope: !39)
!50 = !DILocation(line: 42, column: 20, scope: !39)
!51 = !DILocation(line: 42, column: 9, scope: !39)
!52 = !DILocation(line: 44, column: 1, scope: !11)
!53 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_09_good", scope: !12, file: !12, line: 103, type: !13, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 105, column: 5, scope: !53)
!55 = !DILocation(line: 106, column: 5, scope: !53)
!56 = !DILocation(line: 107, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 119, type: !58, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{!19, !19, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !12, line: 119, type: !19)
!64 = !DILocation(line: 119, column: 14, scope: !57)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !12, line: 119, type: !60)
!66 = !DILocation(line: 119, column: 27, scope: !57)
!67 = !DILocation(line: 122, column: 22, scope: !57)
!68 = !DILocation(line: 122, column: 12, scope: !57)
!69 = !DILocation(line: 122, column: 5, scope: !57)
!70 = !DILocation(line: 124, column: 5, scope: !57)
!71 = !DILocation(line: 125, column: 5, scope: !57)
!72 = !DILocation(line: 126, column: 5, scope: !57)
!73 = !DILocation(line: 129, column: 5, scope: !57)
!74 = !DILocation(line: 130, column: 5, scope: !57)
!75 = !DILocation(line: 131, column: 5, scope: !57)
!76 = !DILocation(line: 133, column: 5, scope: !57)
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "data", scope: !77, file: !12, line: 53, type: !16)
!79 = !DILocation(line: 53, column: 15, scope: !77)
!80 = !DILocalVariable(name: "dataBuffer", scope: !77, file: !12, line: 54, type: !22)
!81 = !DILocation(line: 54, column: 13, scope: !77)
!82 = !DILocation(line: 55, column: 13, scope: !77)
!83 = !DILocation(line: 55, column: 5, scope: !77)
!84 = !DILocation(line: 56, column: 5, scope: !77)
!85 = !DILocation(line: 56, column: 23, scope: !77)
!86 = !DILocation(line: 57, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !77, file: !12, line: 57, column: 8)
!88 = !DILocation(line: 57, column: 8, scope: !77)
!89 = !DILocation(line: 60, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !12, line: 58, column: 5)
!91 = !DILocation(line: 61, column: 5, scope: !90)
!92 = !DILocation(line: 65, column: 16, scope: !93)
!93 = distinct !DILexicalBlock(scope: !87, file: !12, line: 63, column: 5)
!94 = !DILocation(line: 65, column: 14, scope: !93)
!95 = !DILocalVariable(name: "source", scope: !96, file: !12, line: 68, type: !22)
!96 = distinct !DILexicalBlock(scope: !77, file: !12, line: 67, column: 5)
!97 = !DILocation(line: 68, column: 17, scope: !96)
!98 = !DILocation(line: 69, column: 17, scope: !96)
!99 = !DILocation(line: 69, column: 9, scope: !96)
!100 = !DILocation(line: 70, column: 9, scope: !96)
!101 = !DILocation(line: 70, column: 23, scope: !96)
!102 = !DILocation(line: 72, column: 17, scope: !96)
!103 = !DILocation(line: 72, column: 23, scope: !96)
!104 = !DILocation(line: 72, column: 9, scope: !96)
!105 = !DILocation(line: 74, column: 9, scope: !96)
!106 = !DILocation(line: 74, column: 21, scope: !96)
!107 = !DILocation(line: 75, column: 20, scope: !96)
!108 = !DILocation(line: 75, column: 9, scope: !96)
!109 = !DILocation(line: 77, column: 1, scope: !77)
!110 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 80, type: !13, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!111 = !DILocalVariable(name: "data", scope: !110, file: !12, line: 82, type: !16)
!112 = !DILocation(line: 82, column: 15, scope: !110)
!113 = !DILocalVariable(name: "dataBuffer", scope: !110, file: !12, line: 83, type: !22)
!114 = !DILocation(line: 83, column: 13, scope: !110)
!115 = !DILocation(line: 84, column: 13, scope: !110)
!116 = !DILocation(line: 84, column: 5, scope: !110)
!117 = !DILocation(line: 85, column: 5, scope: !110)
!118 = !DILocation(line: 85, column: 23, scope: !110)
!119 = !DILocation(line: 86, column: 8, scope: !120)
!120 = distinct !DILexicalBlock(scope: !110, file: !12, line: 86, column: 8)
!121 = !DILocation(line: 86, column: 8, scope: !110)
!122 = !DILocation(line: 89, column: 16, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !12, line: 87, column: 5)
!124 = !DILocation(line: 89, column: 14, scope: !123)
!125 = !DILocation(line: 90, column: 5, scope: !123)
!126 = !DILocalVariable(name: "source", scope: !127, file: !12, line: 92, type: !22)
!127 = distinct !DILexicalBlock(scope: !110, file: !12, line: 91, column: 5)
!128 = !DILocation(line: 92, column: 17, scope: !127)
!129 = !DILocation(line: 93, column: 17, scope: !127)
!130 = !DILocation(line: 93, column: 9, scope: !127)
!131 = !DILocation(line: 94, column: 9, scope: !127)
!132 = !DILocation(line: 94, column: 23, scope: !127)
!133 = !DILocation(line: 96, column: 17, scope: !127)
!134 = !DILocation(line: 96, column: 23, scope: !127)
!135 = !DILocation(line: 96, column: 9, scope: !127)
!136 = !DILocation(line: 98, column: 9, scope: !127)
!137 = !DILocation(line: 98, column: 21, scope: !127)
!138 = !DILocation(line: 99, column: 20, scope: !127)
!139 = !DILocation(line: 99, column: 9, scope: !127)
!140 = !DILocation(line: 101, column: 1, scope: !110)
