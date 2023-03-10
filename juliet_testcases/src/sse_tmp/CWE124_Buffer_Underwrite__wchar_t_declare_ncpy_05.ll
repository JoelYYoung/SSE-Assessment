; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_05.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !8
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !31
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !32
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  %0 = load i32, i32* @staticTrue, align 4, !dbg !35
  %tobool = icmp ne i32 %0, 0, !dbg !35
  br i1 %tobool, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !38
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !40
  store i32* %add.ptr, i32** %data, align 8, !dbg !41
  br label %if.end, !dbg !42

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !43, metadata !DIExpression()), !dbg !45
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !46
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !47
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !48
  store i32 0, i32* %arrayidx4, align 4, !dbg !49
  %1 = load i32*, i32** %data, align 8, !dbg !50
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !51
  %call6 = call i32* @wcsncpy(i32* %1, i32* %arraydecay5, i64 99) #4, !dbg !52
  %2 = load i32*, i32** %data, align 8, !dbg !53
  %arrayidx7 = getelementptr inbounds i32, i32* %2, i64 99, !dbg !53
  store i32 0, i32* %arrayidx7, align 4, !dbg !54
  %3 = load i32*, i32** %data, align 8, !dbg !55
  call void @printWLine(i32* %3), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_05_good() #0 !dbg !58 {
entry:
  call void @goodG2B1(), !dbg !59
  call void @goodG2B2(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #4, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #4, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_05_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_05_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !82 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !87
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !88
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !89
  store i32 0, i32* %arrayidx, align 4, !dbg !90
  %0 = load i32, i32* @staticFalse, align 4, !dbg !91
  %tobool = icmp ne i32 %0, 0, !dbg !91
  br i1 %tobool, label %if.then, label %if.else, !dbg !93

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !94
  br label %if.end, !dbg !96

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !97
  store i32* %arraydecay1, i32** %data, align 8, !dbg !99
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !100, metadata !DIExpression()), !dbg !102
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !103
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !104
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !105
  store i32 0, i32* %arrayidx4, align 4, !dbg !106
  %1 = load i32*, i32** %data, align 8, !dbg !107
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !108
  %call6 = call i32* @wcsncpy(i32* %1, i32* %arraydecay5, i64 99) #4, !dbg !109
  %2 = load i32*, i32** %data, align 8, !dbg !110
  %arrayidx7 = getelementptr inbounds i32, i32* %2, i64 99, !dbg !110
  store i32 0, i32* %arrayidx7, align 4, !dbg !111
  %3 = load i32*, i32** %data, align 8, !dbg !112
  call void @printWLine(i32* %3), !dbg !113
  ret void, !dbg !114
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !115 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !118, metadata !DIExpression()), !dbg !119
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !120
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !121
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !122
  store i32 0, i32* %arrayidx, align 4, !dbg !123
  %0 = load i32, i32* @staticTrue, align 4, !dbg !124
  %tobool = icmp ne i32 %0, 0, !dbg !124
  br i1 %tobool, label %if.then, label %if.end, !dbg !126

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !127
  store i32* %arraydecay1, i32** %data, align 8, !dbg !129
  br label %if.end, !dbg !130

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !131, metadata !DIExpression()), !dbg !133
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !134
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !135
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !136
  store i32 0, i32* %arrayidx4, align 4, !dbg !137
  %1 = load i32*, i32** %data, align 8, !dbg !138
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !139
  %call6 = call i32* @wcsncpy(i32* %1, i32* %arraydecay5, i64 99) #4, !dbg !140
  %2 = load i32*, i32** %data, align 8, !dbg !141
  %arrayidx7 = getelementptr inbounds i32, i32* %2, i64 99, !dbg !141
  store i32 0, i32* %arrayidx7, align 4, !dbg !142
  %3 = load i32*, i32** %data, align 8, !dbg !143
  call void @printWLine(i32* %3), !dbg !144
  ret void, !dbg !145
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 25, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 26, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_05_bad", scope: !10, file: !10, line: 30, type: !19, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !24, line: 74, baseType: !11)
!24 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!25 = !DILocation(line: 32, column: 15, scope: !18)
!26 = !DILocalVariable(name: "dataBuffer", scope: !18, file: !10, line: 33, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 33, column: 13, scope: !18)
!31 = !DILocation(line: 34, column: 13, scope: !18)
!32 = !DILocation(line: 34, column: 5, scope: !18)
!33 = !DILocation(line: 35, column: 5, scope: !18)
!34 = !DILocation(line: 35, column: 23, scope: !18)
!35 = !DILocation(line: 36, column: 8, scope: !36)
!36 = distinct !DILexicalBlock(scope: !18, file: !10, line: 36, column: 8)
!37 = !DILocation(line: 36, column: 8, scope: !18)
!38 = !DILocation(line: 39, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !10, line: 37, column: 5)
!40 = !DILocation(line: 39, column: 27, scope: !39)
!41 = !DILocation(line: 39, column: 14, scope: !39)
!42 = !DILocation(line: 40, column: 5, scope: !39)
!43 = !DILocalVariable(name: "source", scope: !44, file: !10, line: 42, type: !27)
!44 = distinct !DILexicalBlock(scope: !18, file: !10, line: 41, column: 5)
!45 = !DILocation(line: 42, column: 17, scope: !44)
!46 = !DILocation(line: 43, column: 17, scope: !44)
!47 = !DILocation(line: 43, column: 9, scope: !44)
!48 = !DILocation(line: 44, column: 9, scope: !44)
!49 = !DILocation(line: 44, column: 23, scope: !44)
!50 = !DILocation(line: 46, column: 17, scope: !44)
!51 = !DILocation(line: 46, column: 23, scope: !44)
!52 = !DILocation(line: 46, column: 9, scope: !44)
!53 = !DILocation(line: 48, column: 9, scope: !44)
!54 = !DILocation(line: 48, column: 21, scope: !44)
!55 = !DILocation(line: 49, column: 20, scope: !44)
!56 = !DILocation(line: 49, column: 9, scope: !44)
!57 = !DILocation(line: 51, column: 1, scope: !18)
!58 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_05_good", scope: !10, file: !10, line: 110, type: !19, scopeLine: 111, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!59 = !DILocation(line: 112, column: 5, scope: !58)
!60 = !DILocation(line: 113, column: 5, scope: !58)
!61 = !DILocation(line: 114, column: 1, scope: !58)
!62 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 126, type: !63, scopeLine: 127, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!63 = !DISubroutineType(types: !64)
!64 = !{!11, !11, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !10, line: 126, type: !11)
!69 = !DILocation(line: 126, column: 14, scope: !62)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !10, line: 126, type: !65)
!71 = !DILocation(line: 126, column: 27, scope: !62)
!72 = !DILocation(line: 129, column: 22, scope: !62)
!73 = !DILocation(line: 129, column: 12, scope: !62)
!74 = !DILocation(line: 129, column: 5, scope: !62)
!75 = !DILocation(line: 131, column: 5, scope: !62)
!76 = !DILocation(line: 132, column: 5, scope: !62)
!77 = !DILocation(line: 133, column: 5, scope: !62)
!78 = !DILocation(line: 136, column: 5, scope: !62)
!79 = !DILocation(line: 137, column: 5, scope: !62)
!80 = !DILocation(line: 138, column: 5, scope: !62)
!81 = !DILocation(line: 140, column: 5, scope: !62)
!82 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 58, type: !19, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!83 = !DILocalVariable(name: "data", scope: !82, file: !10, line: 60, type: !22)
!84 = !DILocation(line: 60, column: 15, scope: !82)
!85 = !DILocalVariable(name: "dataBuffer", scope: !82, file: !10, line: 61, type: !27)
!86 = !DILocation(line: 61, column: 13, scope: !82)
!87 = !DILocation(line: 62, column: 13, scope: !82)
!88 = !DILocation(line: 62, column: 5, scope: !82)
!89 = !DILocation(line: 63, column: 5, scope: !82)
!90 = !DILocation(line: 63, column: 23, scope: !82)
!91 = !DILocation(line: 64, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !82, file: !10, line: 64, column: 8)
!93 = !DILocation(line: 64, column: 8, scope: !82)
!94 = !DILocation(line: 67, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !10, line: 65, column: 5)
!96 = !DILocation(line: 68, column: 5, scope: !95)
!97 = !DILocation(line: 72, column: 16, scope: !98)
!98 = distinct !DILexicalBlock(scope: !92, file: !10, line: 70, column: 5)
!99 = !DILocation(line: 72, column: 14, scope: !98)
!100 = !DILocalVariable(name: "source", scope: !101, file: !10, line: 75, type: !27)
!101 = distinct !DILexicalBlock(scope: !82, file: !10, line: 74, column: 5)
!102 = !DILocation(line: 75, column: 17, scope: !101)
!103 = !DILocation(line: 76, column: 17, scope: !101)
!104 = !DILocation(line: 76, column: 9, scope: !101)
!105 = !DILocation(line: 77, column: 9, scope: !101)
!106 = !DILocation(line: 77, column: 23, scope: !101)
!107 = !DILocation(line: 79, column: 17, scope: !101)
!108 = !DILocation(line: 79, column: 23, scope: !101)
!109 = !DILocation(line: 79, column: 9, scope: !101)
!110 = !DILocation(line: 81, column: 9, scope: !101)
!111 = !DILocation(line: 81, column: 21, scope: !101)
!112 = !DILocation(line: 82, column: 20, scope: !101)
!113 = !DILocation(line: 82, column: 9, scope: !101)
!114 = !DILocation(line: 84, column: 1, scope: !82)
!115 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 87, type: !19, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!116 = !DILocalVariable(name: "data", scope: !115, file: !10, line: 89, type: !22)
!117 = !DILocation(line: 89, column: 15, scope: !115)
!118 = !DILocalVariable(name: "dataBuffer", scope: !115, file: !10, line: 90, type: !27)
!119 = !DILocation(line: 90, column: 13, scope: !115)
!120 = !DILocation(line: 91, column: 13, scope: !115)
!121 = !DILocation(line: 91, column: 5, scope: !115)
!122 = !DILocation(line: 92, column: 5, scope: !115)
!123 = !DILocation(line: 92, column: 23, scope: !115)
!124 = !DILocation(line: 93, column: 8, scope: !125)
!125 = distinct !DILexicalBlock(scope: !115, file: !10, line: 93, column: 8)
!126 = !DILocation(line: 93, column: 8, scope: !115)
!127 = !DILocation(line: 96, column: 16, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !10, line: 94, column: 5)
!129 = !DILocation(line: 96, column: 14, scope: !128)
!130 = !DILocation(line: 97, column: 5, scope: !128)
!131 = !DILocalVariable(name: "source", scope: !132, file: !10, line: 99, type: !27)
!132 = distinct !DILexicalBlock(scope: !115, file: !10, line: 98, column: 5)
!133 = !DILocation(line: 99, column: 17, scope: !132)
!134 = !DILocation(line: 100, column: 17, scope: !132)
!135 = !DILocation(line: 100, column: 9, scope: !132)
!136 = !DILocation(line: 101, column: 9, scope: !132)
!137 = !DILocation(line: 101, column: 23, scope: !132)
!138 = !DILocation(line: 103, column: 17, scope: !132)
!139 = !DILocation(line: 103, column: 23, scope: !132)
!140 = !DILocation(line: 103, column: 9, scope: !132)
!141 = !DILocation(line: 105, column: 9, scope: !132)
!142 = !DILocation(line: 105, column: 21, scope: !132)
!143 = !DILocation(line: 106, column: 20, scope: !132)
!144 = !DILocation(line: 106, column: 9, scope: !132)
!145 = !DILocation(line: 108, column: 1, scope: !115)
