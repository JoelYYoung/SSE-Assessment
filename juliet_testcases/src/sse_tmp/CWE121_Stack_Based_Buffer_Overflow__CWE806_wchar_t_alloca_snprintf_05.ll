; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !12
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_05_bad() #0 !dbg !21 {
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
  %call = call i32* @wmemset(i32* %4, i32 65, i64 99) #6, !dbg !37
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
  %call1 = call i64 @wcslen(i32* %7) #7, !dbg !49
  %8 = load i32*, i32** %data, align 8, !dbg !50
  %call2 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call1, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %8) #6, !dbg !51
  %9 = load i32*, i32** %data, align 8, !dbg !52
  call void @printWLine(i32* %9), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_05_good() #0 !dbg !55 {
entry:
  call void @goodG2B1(), !dbg !56
  call void @goodG2B2(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* null) #6, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #6, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_05_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_05_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !79 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %0 = alloca i8, i64 400, align 16, !dbg !84
  %1 = bitcast i8* %0 to i32*, !dbg !85
  store i32* %1, i32** %dataBuffer, align 8, !dbg !83
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !86
  store i32* %2, i32** %data, align 8, !dbg !87
  %3 = load i32, i32* @staticFalse, align 4, !dbg !88
  %tobool = icmp ne i32 %3, 0, !dbg !88
  br i1 %tobool, label %if.then, label %if.else, !dbg !90

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !91
  br label %if.end, !dbg !93

if.else:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !94
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !96
  %5 = load i32*, i32** %data, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !97
  store i32 0, i32* %arrayidx, align 4, !dbg !98
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !99, metadata !DIExpression()), !dbg !101
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !101
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !102
  %7 = load i32*, i32** %data, align 8, !dbg !103
  %call1 = call i64 @wcslen(i32* %7) #7, !dbg !104
  %8 = load i32*, i32** %data, align 8, !dbg !105
  %call2 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call1, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %8) #6, !dbg !106
  %9 = load i32*, i32** %data, align 8, !dbg !107
  call void @printWLine(i32* %9), !dbg !108
  ret void, !dbg !109
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !110 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  %0 = alloca i8, i64 400, align 16, !dbg !115
  %1 = bitcast i8* %0 to i32*, !dbg !116
  store i32* %1, i32** %dataBuffer, align 8, !dbg !114
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !117
  store i32* %2, i32** %data, align 8, !dbg !118
  %3 = load i32, i32* @staticTrue, align 4, !dbg !119
  %tobool = icmp ne i32 %3, 0, !dbg !119
  br i1 %tobool, label %if.then, label %if.end, !dbg !121

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !122
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !124
  %5 = load i32*, i32** %data, align 8, !dbg !125
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !125
  store i32 0, i32* %arrayidx, align 4, !dbg !126
  br label %if.end, !dbg !127

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !128, metadata !DIExpression()), !dbg !130
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !130
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !130
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !131
  %7 = load i32*, i32** %data, align 8, !dbg !132
  %call1 = call i64 @wcslen(i32* %7) #7, !dbg !133
  %8 = load i32*, i32** %data, align 8, !dbg !134
  %call2 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call1, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %8) #6, !dbg !135
  %9 = load i32*, i32** %data, align 8, !dbg !136
  call void @printWLine(i32* %9), !dbg !137
  ret void, !dbg !138
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !14, line: 31, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !14, line: 32, type: !9, isLocal: true, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_05.c", directory: "/root/SSE-Assessment")
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_05_bad", scope: !14, file: !14, line: 36, type: !22, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !14, line: 38, type: !6)
!25 = !DILocation(line: 38, column: 15, scope: !21)
!26 = !DILocalVariable(name: "dataBuffer", scope: !21, file: !14, line: 39, type: !6)
!27 = !DILocation(line: 39, column: 15, scope: !21)
!28 = !DILocation(line: 39, column: 39, scope: !21)
!29 = !DILocation(line: 39, column: 28, scope: !21)
!30 = !DILocation(line: 40, column: 12, scope: !21)
!31 = !DILocation(line: 40, column: 10, scope: !21)
!32 = !DILocation(line: 41, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !21, file: !14, line: 41, column: 8)
!34 = !DILocation(line: 41, column: 8, scope: !21)
!35 = !DILocation(line: 44, column: 17, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !14, line: 42, column: 5)
!37 = !DILocation(line: 44, column: 9, scope: !36)
!38 = !DILocation(line: 45, column: 9, scope: !36)
!39 = !DILocation(line: 45, column: 21, scope: !36)
!40 = !DILocation(line: 46, column: 5, scope: !36)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !14, line: 48, type: !43)
!42 = distinct !DILexicalBlock(scope: !21, file: !14, line: 47, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1600, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 50)
!46 = !DILocation(line: 48, column: 17, scope: !42)
!47 = !DILocation(line: 50, column: 18, scope: !42)
!48 = !DILocation(line: 50, column: 31, scope: !42)
!49 = !DILocation(line: 50, column: 24, scope: !42)
!50 = !DILocation(line: 50, column: 45, scope: !42)
!51 = !DILocation(line: 50, column: 9, scope: !42)
!52 = !DILocation(line: 51, column: 20, scope: !42)
!53 = !DILocation(line: 51, column: 9, scope: !42)
!54 = !DILocation(line: 53, column: 1, scope: !21)
!55 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_05_good", scope: !14, file: !14, line: 104, type: !22, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!56 = !DILocation(line: 106, column: 5, scope: !55)
!57 = !DILocation(line: 107, column: 5, scope: !55)
!58 = !DILocation(line: 108, column: 1, scope: !55)
!59 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 120, type: !60, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!60 = !DISubroutineType(types: !61)
!61 = !{!9, !9, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !14, line: 120, type: !9)
!66 = !DILocation(line: 120, column: 14, scope: !59)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !14, line: 120, type: !62)
!68 = !DILocation(line: 120, column: 27, scope: !59)
!69 = !DILocation(line: 123, column: 22, scope: !59)
!70 = !DILocation(line: 123, column: 12, scope: !59)
!71 = !DILocation(line: 123, column: 5, scope: !59)
!72 = !DILocation(line: 125, column: 5, scope: !59)
!73 = !DILocation(line: 126, column: 5, scope: !59)
!74 = !DILocation(line: 127, column: 5, scope: !59)
!75 = !DILocation(line: 130, column: 5, scope: !59)
!76 = !DILocation(line: 131, column: 5, scope: !59)
!77 = !DILocation(line: 132, column: 5, scope: !59)
!78 = !DILocation(line: 134, column: 5, scope: !59)
!79 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 60, type: !22, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DILocalVariable(name: "data", scope: !79, file: !14, line: 62, type: !6)
!81 = !DILocation(line: 62, column: 15, scope: !79)
!82 = !DILocalVariable(name: "dataBuffer", scope: !79, file: !14, line: 63, type: !6)
!83 = !DILocation(line: 63, column: 15, scope: !79)
!84 = !DILocation(line: 63, column: 39, scope: !79)
!85 = !DILocation(line: 63, column: 28, scope: !79)
!86 = !DILocation(line: 64, column: 12, scope: !79)
!87 = !DILocation(line: 64, column: 10, scope: !79)
!88 = !DILocation(line: 65, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !79, file: !14, line: 65, column: 8)
!90 = !DILocation(line: 65, column: 8, scope: !79)
!91 = !DILocation(line: 68, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !14, line: 66, column: 5)
!93 = !DILocation(line: 69, column: 5, scope: !92)
!94 = !DILocation(line: 73, column: 17, scope: !95)
!95 = distinct !DILexicalBlock(scope: !89, file: !14, line: 71, column: 5)
!96 = !DILocation(line: 73, column: 9, scope: !95)
!97 = !DILocation(line: 74, column: 9, scope: !95)
!98 = !DILocation(line: 74, column: 20, scope: !95)
!99 = !DILocalVariable(name: "dest", scope: !100, file: !14, line: 77, type: !43)
!100 = distinct !DILexicalBlock(scope: !79, file: !14, line: 76, column: 5)
!101 = !DILocation(line: 77, column: 17, scope: !100)
!102 = !DILocation(line: 79, column: 18, scope: !100)
!103 = !DILocation(line: 79, column: 31, scope: !100)
!104 = !DILocation(line: 79, column: 24, scope: !100)
!105 = !DILocation(line: 79, column: 45, scope: !100)
!106 = !DILocation(line: 79, column: 9, scope: !100)
!107 = !DILocation(line: 80, column: 20, scope: !100)
!108 = !DILocation(line: 80, column: 9, scope: !100)
!109 = !DILocation(line: 82, column: 1, scope: !79)
!110 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 85, type: !22, scopeLine: 86, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!111 = !DILocalVariable(name: "data", scope: !110, file: !14, line: 87, type: !6)
!112 = !DILocation(line: 87, column: 15, scope: !110)
!113 = !DILocalVariable(name: "dataBuffer", scope: !110, file: !14, line: 88, type: !6)
!114 = !DILocation(line: 88, column: 15, scope: !110)
!115 = !DILocation(line: 88, column: 39, scope: !110)
!116 = !DILocation(line: 88, column: 28, scope: !110)
!117 = !DILocation(line: 89, column: 12, scope: !110)
!118 = !DILocation(line: 89, column: 10, scope: !110)
!119 = !DILocation(line: 90, column: 8, scope: !120)
!120 = distinct !DILexicalBlock(scope: !110, file: !14, line: 90, column: 8)
!121 = !DILocation(line: 90, column: 8, scope: !110)
!122 = !DILocation(line: 93, column: 17, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !14, line: 91, column: 5)
!124 = !DILocation(line: 93, column: 9, scope: !123)
!125 = !DILocation(line: 94, column: 9, scope: !123)
!126 = !DILocation(line: 94, column: 20, scope: !123)
!127 = !DILocation(line: 95, column: 5, scope: !123)
!128 = !DILocalVariable(name: "dest", scope: !129, file: !14, line: 97, type: !43)
!129 = distinct !DILexicalBlock(scope: !110, file: !14, line: 96, column: 5)
!130 = !DILocation(line: 97, column: 17, scope: !129)
!131 = !DILocation(line: 99, column: 18, scope: !129)
!132 = !DILocation(line: 99, column: 31, scope: !129)
!133 = !DILocation(line: 99, column: 24, scope: !129)
!134 = !DILocation(line: 99, column: 45, scope: !129)
!135 = !DILocation(line: 99, column: 9, scope: !129)
!136 = !DILocation(line: 100, column: 20, scope: !129)
!137 = !DILocation(line: 100, column: 9, scope: !129)
!138 = !DILocation(line: 102, column: 1, scope: !110)
