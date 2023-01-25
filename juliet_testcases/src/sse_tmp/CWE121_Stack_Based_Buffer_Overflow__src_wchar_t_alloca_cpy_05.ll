; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !12
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_05_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 400, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBuffer, align 8, !dbg !27
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !30
  store i32* %2, i32** %data, align 8, !dbg !31
  %3 = load i32, i32* @staticTrue, align 4, !dbg !32
  %tobool = icmp ne i32 %3, 0, !dbg !32
  br i1 %tobool, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !35
  %call = call i32* @wmemset(i32* %4, i32 65, i64 99) #5, !dbg !37
  %5 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 99, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !41, metadata !DIExpression()), !dbg !46
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !46
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !47
  %7 = load i32*, i32** %data, align 8, !dbg !48
  %call1 = call i32* @wcscpy(i32* %arraydecay, i32* %7) #5, !dbg !49
  %8 = load i32*, i32** %data, align 8, !dbg !50
  call void @printWLine(i32* %8), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_05_good() #0 !dbg !53 {
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
  %call = call i64 @time(i64* null) #5, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #5, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_05_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_05_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !77 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %0 = alloca i8, i64 400, align 16, !dbg !82
  %1 = bitcast i8* %0 to i32*, !dbg !83
  store i32* %1, i32** %dataBuffer, align 8, !dbg !81
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !84
  store i32* %2, i32** %data, align 8, !dbg !85
  %3 = load i32, i32* @staticFalse, align 4, !dbg !86
  %tobool = icmp ne i32 %3, 0, !dbg !86
  br i1 %tobool, label %if.then, label %if.else, !dbg !88

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !89
  br label %if.end, !dbg !91

if.else:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !92
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !94
  %5 = load i32*, i32** %data, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !95
  store i32 0, i32* %arrayidx, align 4, !dbg !96
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !97, metadata !DIExpression()), !dbg !99
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !99
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !100
  %7 = load i32*, i32** %data, align 8, !dbg !101
  %call1 = call i32* @wcscpy(i32* %arraydecay, i32* %7) #5, !dbg !102
  %8 = load i32*, i32** %data, align 8, !dbg !103
  call void @printWLine(i32* %8), !dbg !104
  ret void, !dbg !105
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !106 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %0 = alloca i8, i64 400, align 16, !dbg !111
  %1 = bitcast i8* %0 to i32*, !dbg !112
  store i32* %1, i32** %dataBuffer, align 8, !dbg !110
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !113
  store i32* %2, i32** %data, align 8, !dbg !114
  %3 = load i32, i32* @staticTrue, align 4, !dbg !115
  %tobool = icmp ne i32 %3, 0, !dbg !115
  br i1 %tobool, label %if.then, label %if.end, !dbg !117

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !118
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !120
  %5 = load i32*, i32** %data, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !121
  store i32 0, i32* %arrayidx, align 4, !dbg !122
  br label %if.end, !dbg !123

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !124, metadata !DIExpression()), !dbg !126
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !126
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !126
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !127
  %7 = load i32*, i32** %data, align 8, !dbg !128
  %call1 = call i32* @wcscpy(i32* %arraydecay, i32* %7) #5, !dbg !129
  %8 = load i32*, i32** %data, align 8, !dbg !130
  call void @printWLine(i32* %8), !dbg !131
  ret void, !dbg !132
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !14, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !14, line: 26, type: !9, isLocal: true, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_05_bad", scope: !14, file: !14, line: 30, type: !22, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !14, line: 32, type: !6)
!25 = !DILocation(line: 32, column: 15, scope: !21)
!26 = !DILocalVariable(name: "dataBuffer", scope: !21, file: !14, line: 33, type: !6)
!27 = !DILocation(line: 33, column: 15, scope: !21)
!28 = !DILocation(line: 33, column: 39, scope: !21)
!29 = !DILocation(line: 33, column: 28, scope: !21)
!30 = !DILocation(line: 34, column: 12, scope: !21)
!31 = !DILocation(line: 34, column: 10, scope: !21)
!32 = !DILocation(line: 35, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !21, file: !14, line: 35, column: 8)
!34 = !DILocation(line: 35, column: 8, scope: !21)
!35 = !DILocation(line: 38, column: 17, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !14, line: 36, column: 5)
!37 = !DILocation(line: 38, column: 9, scope: !36)
!38 = !DILocation(line: 39, column: 9, scope: !36)
!39 = !DILocation(line: 39, column: 21, scope: !36)
!40 = !DILocation(line: 40, column: 5, scope: !36)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !14, line: 42, type: !43)
!42 = distinct !DILexicalBlock(scope: !21, file: !14, line: 41, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1600, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 50)
!46 = !DILocation(line: 42, column: 17, scope: !42)
!47 = !DILocation(line: 44, column: 16, scope: !42)
!48 = !DILocation(line: 44, column: 22, scope: !42)
!49 = !DILocation(line: 44, column: 9, scope: !42)
!50 = !DILocation(line: 45, column: 20, scope: !42)
!51 = !DILocation(line: 45, column: 9, scope: !42)
!52 = !DILocation(line: 47, column: 1, scope: !21)
!53 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_05_good", scope: !14, file: !14, line: 98, type: !22, scopeLine: 99, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DILocation(line: 100, column: 5, scope: !53)
!55 = !DILocation(line: 101, column: 5, scope: !53)
!56 = !DILocation(line: 102, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 114, type: !58, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!58 = !DISubroutineType(types: !59)
!59 = !{!9, !9, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !14, line: 114, type: !9)
!64 = !DILocation(line: 114, column: 14, scope: !57)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !14, line: 114, type: !60)
!66 = !DILocation(line: 114, column: 27, scope: !57)
!67 = !DILocation(line: 117, column: 22, scope: !57)
!68 = !DILocation(line: 117, column: 12, scope: !57)
!69 = !DILocation(line: 117, column: 5, scope: !57)
!70 = !DILocation(line: 119, column: 5, scope: !57)
!71 = !DILocation(line: 120, column: 5, scope: !57)
!72 = !DILocation(line: 121, column: 5, scope: !57)
!73 = !DILocation(line: 124, column: 5, scope: !57)
!74 = !DILocation(line: 125, column: 5, scope: !57)
!75 = !DILocation(line: 126, column: 5, scope: !57)
!76 = !DILocation(line: 128, column: 5, scope: !57)
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 54, type: !22, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!78 = !DILocalVariable(name: "data", scope: !77, file: !14, line: 56, type: !6)
!79 = !DILocation(line: 56, column: 15, scope: !77)
!80 = !DILocalVariable(name: "dataBuffer", scope: !77, file: !14, line: 57, type: !6)
!81 = !DILocation(line: 57, column: 15, scope: !77)
!82 = !DILocation(line: 57, column: 39, scope: !77)
!83 = !DILocation(line: 57, column: 28, scope: !77)
!84 = !DILocation(line: 58, column: 12, scope: !77)
!85 = !DILocation(line: 58, column: 10, scope: !77)
!86 = !DILocation(line: 59, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !77, file: !14, line: 59, column: 8)
!88 = !DILocation(line: 59, column: 8, scope: !77)
!89 = !DILocation(line: 62, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !14, line: 60, column: 5)
!91 = !DILocation(line: 63, column: 5, scope: !90)
!92 = !DILocation(line: 67, column: 17, scope: !93)
!93 = distinct !DILexicalBlock(scope: !87, file: !14, line: 65, column: 5)
!94 = !DILocation(line: 67, column: 9, scope: !93)
!95 = !DILocation(line: 68, column: 9, scope: !93)
!96 = !DILocation(line: 68, column: 20, scope: !93)
!97 = !DILocalVariable(name: "dest", scope: !98, file: !14, line: 71, type: !43)
!98 = distinct !DILexicalBlock(scope: !77, file: !14, line: 70, column: 5)
!99 = !DILocation(line: 71, column: 17, scope: !98)
!100 = !DILocation(line: 73, column: 16, scope: !98)
!101 = !DILocation(line: 73, column: 22, scope: !98)
!102 = !DILocation(line: 73, column: 9, scope: !98)
!103 = !DILocation(line: 74, column: 20, scope: !98)
!104 = !DILocation(line: 74, column: 9, scope: !98)
!105 = !DILocation(line: 76, column: 1, scope: !77)
!106 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 79, type: !22, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!107 = !DILocalVariable(name: "data", scope: !106, file: !14, line: 81, type: !6)
!108 = !DILocation(line: 81, column: 15, scope: !106)
!109 = !DILocalVariable(name: "dataBuffer", scope: !106, file: !14, line: 82, type: !6)
!110 = !DILocation(line: 82, column: 15, scope: !106)
!111 = !DILocation(line: 82, column: 39, scope: !106)
!112 = !DILocation(line: 82, column: 28, scope: !106)
!113 = !DILocation(line: 83, column: 12, scope: !106)
!114 = !DILocation(line: 83, column: 10, scope: !106)
!115 = !DILocation(line: 84, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !106, file: !14, line: 84, column: 8)
!117 = !DILocation(line: 84, column: 8, scope: !106)
!118 = !DILocation(line: 87, column: 17, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !14, line: 85, column: 5)
!120 = !DILocation(line: 87, column: 9, scope: !119)
!121 = !DILocation(line: 88, column: 9, scope: !119)
!122 = !DILocation(line: 88, column: 20, scope: !119)
!123 = !DILocation(line: 89, column: 5, scope: !119)
!124 = !DILocalVariable(name: "dest", scope: !125, file: !14, line: 91, type: !43)
!125 = distinct !DILexicalBlock(scope: !106, file: !14, line: 90, column: 5)
!126 = !DILocation(line: 91, column: 17, scope: !125)
!127 = !DILocation(line: 93, column: 16, scope: !125)
!128 = !DILocation(line: 93, column: 22, scope: !125)
!129 = !DILocation(line: 93, column: 9, scope: !125)
!130 = !DILocation(line: 94, column: 20, scope: !125)
!131 = !DILocation(line: 94, column: 9, scope: !125)
!132 = !DILocation(line: 96, column: 1, scope: !106)
