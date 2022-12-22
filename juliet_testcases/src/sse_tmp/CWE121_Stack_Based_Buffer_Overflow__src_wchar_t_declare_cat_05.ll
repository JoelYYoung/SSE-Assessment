; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_05.c"
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !31
  store i32* %arraydecay, i32** %data, align 8, !dbg !32
  %0 = load i32, i32* @staticTrue, align 4, !dbg !33
  %tobool = icmp ne i32 %0, 0, !dbg !33
  br i1 %tobool, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !36
  %call = call i32* @wmemset(i32* %1, i32 65, i64 99) #5, !dbg !38
  %2 = load i32*, i32** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !39
  store i32 0, i32* %arrayidx, align 4, !dbg !40
  br label %if.end, !dbg !41

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !42, metadata !DIExpression()), !dbg !47
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !47
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !48
  %4 = load i32*, i32** %data, align 8, !dbg !49
  %call2 = call i32* @wcscat(i32* %arraydecay1, i32* %4) #5, !dbg !50
  %5 = load i32*, i32** %data, align 8, !dbg !51
  call void @printWLine(i32* %5), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32* @wcscat(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_05_good() #0 !dbg !54 {
entry:
  call void @goodG2B1(), !dbg !55
  call void @goodG2B2(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #5, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #5, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_05_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_05_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !83
  store i32* %arraydecay, i32** %data, align 8, !dbg !84
  %0 = load i32, i32* @staticFalse, align 4, !dbg !85
  %tobool = icmp ne i32 %0, 0, !dbg !85
  br i1 %tobool, label %if.then, label %if.else, !dbg !87

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !88
  br label %if.end, !dbg !90

if.else:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !91
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #5, !dbg !93
  %2 = load i32*, i32** %data, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !94
  store i32 0, i32* %arrayidx, align 4, !dbg !95
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !96, metadata !DIExpression()), !dbg !98
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !98
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !99
  %4 = load i32*, i32** %data, align 8, !dbg !100
  %call2 = call i32* @wcscat(i32* %arraydecay1, i32* %4) #5, !dbg !101
  %5 = load i32*, i32** %data, align 8, !dbg !102
  call void @printWLine(i32* %5), !dbg !103
  ret void, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !105 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !110
  store i32* %arraydecay, i32** %data, align 8, !dbg !111
  %0 = load i32, i32* @staticTrue, align 4, !dbg !112
  %tobool = icmp ne i32 %0, 0, !dbg !112
  br i1 %tobool, label %if.then, label %if.end, !dbg !114

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !115
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #5, !dbg !117
  %2 = load i32*, i32** %data, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !118
  store i32 0, i32* %arrayidx, align 4, !dbg !119
  br label %if.end, !dbg !120

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !121, metadata !DIExpression()), !dbg !123
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !123
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !124
  %4 = load i32*, i32** %data, align 8, !dbg !125
  %call2 = call i32* @wcscat(i32* %arraydecay1, i32* %4) #5, !dbg !126
  %5 = load i32*, i32** %data, align 8, !dbg !127
  call void @printWLine(i32* %5), !dbg !128
  ret void, !dbg !129
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 25, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 26, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_05.c", directory: "/root/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_05_bad", scope: !10, file: !10, line: 30, type: !19, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !24, line: 74, baseType: !11)
!24 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!25 = !DILocation(line: 32, column: 15, scope: !18)
!26 = !DILocalVariable(name: "dataBuffer", scope: !18, file: !10, line: 33, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 33, column: 13, scope: !18)
!31 = !DILocation(line: 34, column: 12, scope: !18)
!32 = !DILocation(line: 34, column: 10, scope: !18)
!33 = !DILocation(line: 35, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !18, file: !10, line: 35, column: 8)
!35 = !DILocation(line: 35, column: 8, scope: !18)
!36 = !DILocation(line: 38, column: 17, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !10, line: 36, column: 5)
!38 = !DILocation(line: 38, column: 9, scope: !37)
!39 = !DILocation(line: 39, column: 9, scope: !37)
!40 = !DILocation(line: 39, column: 21, scope: !37)
!41 = !DILocation(line: 40, column: 5, scope: !37)
!42 = !DILocalVariable(name: "dest", scope: !43, file: !10, line: 42, type: !44)
!43 = distinct !DILexicalBlock(scope: !18, file: !10, line: 41, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 1600, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 50)
!47 = !DILocation(line: 42, column: 17, scope: !43)
!48 = !DILocation(line: 44, column: 16, scope: !43)
!49 = !DILocation(line: 44, column: 22, scope: !43)
!50 = !DILocation(line: 44, column: 9, scope: !43)
!51 = !DILocation(line: 45, column: 20, scope: !43)
!52 = !DILocation(line: 45, column: 9, scope: !43)
!53 = !DILocation(line: 47, column: 1, scope: !18)
!54 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_05_good", scope: !10, file: !10, line: 98, type: !19, scopeLine: 99, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!55 = !DILocation(line: 100, column: 5, scope: !54)
!56 = !DILocation(line: 101, column: 5, scope: !54)
!57 = !DILocation(line: 102, column: 1, scope: !54)
!58 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 114, type: !59, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!59 = !DISubroutineType(types: !60)
!60 = !{!11, !11, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !10, line: 114, type: !11)
!65 = !DILocation(line: 114, column: 14, scope: !58)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !10, line: 114, type: !61)
!67 = !DILocation(line: 114, column: 27, scope: !58)
!68 = !DILocation(line: 117, column: 22, scope: !58)
!69 = !DILocation(line: 117, column: 12, scope: !58)
!70 = !DILocation(line: 117, column: 5, scope: !58)
!71 = !DILocation(line: 119, column: 5, scope: !58)
!72 = !DILocation(line: 120, column: 5, scope: !58)
!73 = !DILocation(line: 121, column: 5, scope: !58)
!74 = !DILocation(line: 124, column: 5, scope: !58)
!75 = !DILocation(line: 125, column: 5, scope: !58)
!76 = !DILocation(line: 126, column: 5, scope: !58)
!77 = !DILocation(line: 128, column: 5, scope: !58)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 54, type: !19, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DILocalVariable(name: "data", scope: !78, file: !10, line: 56, type: !22)
!80 = !DILocation(line: 56, column: 15, scope: !78)
!81 = !DILocalVariable(name: "dataBuffer", scope: !78, file: !10, line: 57, type: !27)
!82 = !DILocation(line: 57, column: 13, scope: !78)
!83 = !DILocation(line: 58, column: 12, scope: !78)
!84 = !DILocation(line: 58, column: 10, scope: !78)
!85 = !DILocation(line: 59, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !78, file: !10, line: 59, column: 8)
!87 = !DILocation(line: 59, column: 8, scope: !78)
!88 = !DILocation(line: 62, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !10, line: 60, column: 5)
!90 = !DILocation(line: 63, column: 5, scope: !89)
!91 = !DILocation(line: 67, column: 17, scope: !92)
!92 = distinct !DILexicalBlock(scope: !86, file: !10, line: 65, column: 5)
!93 = !DILocation(line: 67, column: 9, scope: !92)
!94 = !DILocation(line: 68, column: 9, scope: !92)
!95 = !DILocation(line: 68, column: 20, scope: !92)
!96 = !DILocalVariable(name: "dest", scope: !97, file: !10, line: 71, type: !44)
!97 = distinct !DILexicalBlock(scope: !78, file: !10, line: 70, column: 5)
!98 = !DILocation(line: 71, column: 17, scope: !97)
!99 = !DILocation(line: 73, column: 16, scope: !97)
!100 = !DILocation(line: 73, column: 22, scope: !97)
!101 = !DILocation(line: 73, column: 9, scope: !97)
!102 = !DILocation(line: 74, column: 20, scope: !97)
!103 = !DILocation(line: 74, column: 9, scope: !97)
!104 = !DILocation(line: 76, column: 1, scope: !78)
!105 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 79, type: !19, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!106 = !DILocalVariable(name: "data", scope: !105, file: !10, line: 81, type: !22)
!107 = !DILocation(line: 81, column: 15, scope: !105)
!108 = !DILocalVariable(name: "dataBuffer", scope: !105, file: !10, line: 82, type: !27)
!109 = !DILocation(line: 82, column: 13, scope: !105)
!110 = !DILocation(line: 83, column: 12, scope: !105)
!111 = !DILocation(line: 83, column: 10, scope: !105)
!112 = !DILocation(line: 84, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !105, file: !10, line: 84, column: 8)
!114 = !DILocation(line: 84, column: 8, scope: !105)
!115 = !DILocation(line: 87, column: 17, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !10, line: 85, column: 5)
!117 = !DILocation(line: 87, column: 9, scope: !116)
!118 = !DILocation(line: 88, column: 9, scope: !116)
!119 = !DILocation(line: 88, column: 20, scope: !116)
!120 = !DILocation(line: 89, column: 5, scope: !116)
!121 = !DILocalVariable(name: "dest", scope: !122, file: !10, line: 91, type: !44)
!122 = distinct !DILexicalBlock(scope: !105, file: !10, line: 90, column: 5)
!123 = !DILocation(line: 91, column: 17, scope: !122)
!124 = !DILocation(line: 93, column: 16, scope: !122)
!125 = !DILocation(line: 93, column: 22, scope: !122)
!126 = !DILocation(line: 93, column: 9, scope: !122)
!127 = !DILocation(line: 94, column: 20, scope: !122)
!128 = !DILocation(line: 94, column: 9, scope: !122)
!129 = !DILocation(line: 96, column: 1, scope: !105)
