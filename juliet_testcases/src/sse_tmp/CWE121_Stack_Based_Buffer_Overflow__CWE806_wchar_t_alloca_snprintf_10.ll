; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_10.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalTrue = external dso_local global i32, align 4
@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external dso_local global i32, align 4
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_10_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 400, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBuffer, align 8, !dbg !22
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !25
  store i32* %2, i32** %data, align 8, !dbg !26
  %3 = load i32, i32* @globalTrue, align 4, !dbg !27
  %tobool = icmp ne i32 %3, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !30
  %call = call i32* @wmemset(i32* %4, i32 65, i64 99) #6, !dbg !32
  %5 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  br label %if.end, !dbg !35

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !36, metadata !DIExpression()), !dbg !41
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !41
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !42
  %7 = load i32*, i32** %data, align 8, !dbg !43
  %call1 = call i64 @wcslen(i32* %7) #7, !dbg !44
  %8 = load i32*, i32** %data, align 8, !dbg !45
  %call2 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call1, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %8) #6, !dbg !46
  %9 = load i32*, i32** %data, align 8, !dbg !47
  call void @printWLine(i32* %9), !dbg !48
  ret void, !dbg !49
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_10_good() #0 !dbg !50 {
entry:
  call void @goodG2B1(), !dbg !51
  call void @goodG2B2(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* null) #6, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #6, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_10_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_10_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !74 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %0 = alloca i8, i64 400, align 16, !dbg !79
  %1 = bitcast i8* %0 to i32*, !dbg !80
  store i32* %1, i32** %dataBuffer, align 8, !dbg !78
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !81
  store i32* %2, i32** %data, align 8, !dbg !82
  %3 = load i32, i32* @globalFalse, align 4, !dbg !83
  %tobool = icmp ne i32 %3, 0, !dbg !83
  br i1 %tobool, label %if.then, label %if.else, !dbg !85

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !86
  br label %if.end, !dbg !88

if.else:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !89
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !91
  %5 = load i32*, i32** %data, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !92
  store i32 0, i32* %arrayidx, align 4, !dbg !93
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !94, metadata !DIExpression()), !dbg !96
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !96
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !97
  %7 = load i32*, i32** %data, align 8, !dbg !98
  %call1 = call i64 @wcslen(i32* %7) #7, !dbg !99
  %8 = load i32*, i32** %data, align 8, !dbg !100
  %call2 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call1, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %8) #6, !dbg !101
  %9 = load i32*, i32** %data, align 8, !dbg !102
  call void @printWLine(i32* %9), !dbg !103
  ret void, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !105 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %0 = alloca i8, i64 400, align 16, !dbg !110
  %1 = bitcast i8* %0 to i32*, !dbg !111
  store i32* %1, i32** %dataBuffer, align 8, !dbg !109
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !112
  store i32* %2, i32** %data, align 8, !dbg !113
  %3 = load i32, i32* @globalTrue, align 4, !dbg !114
  %tobool = icmp ne i32 %3, 0, !dbg !114
  br i1 %tobool, label %if.then, label %if.end, !dbg !116

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !117
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !119
  %5 = load i32*, i32** %data, align 8, !dbg !120
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !120
  store i32 0, i32* %arrayidx, align 4, !dbg !121
  br label %if.end, !dbg !122

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !123, metadata !DIExpression()), !dbg !125
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !125
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !126
  %7 = load i32*, i32** %data, align 8, !dbg !127
  %call1 = call i64 @wcslen(i32* %7) #7, !dbg !128
  %8 = load i32*, i32** %data, align 8, !dbg !129
  %call2 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call1, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %8) #6, !dbg !130
  %9 = load i32*, i32** %data, align 8, !dbg !131
  call void @printWLine(i32* %9), !dbg !132
  ret void, !dbg !133
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_10.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_10_bad", scope: !16, file: !16, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_10.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 31, type: !4)
!20 = !DILocation(line: 31, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 32, type: !4)
!22 = !DILocation(line: 32, column: 15, scope: !15)
!23 = !DILocation(line: 32, column: 39, scope: !15)
!24 = !DILocation(line: 32, column: 28, scope: !15)
!25 = !DILocation(line: 33, column: 12, scope: !15)
!26 = !DILocation(line: 33, column: 10, scope: !15)
!27 = !DILocation(line: 34, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !15, file: !16, line: 34, column: 8)
!29 = !DILocation(line: 34, column: 8, scope: !15)
!30 = !DILocation(line: 37, column: 17, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !16, line: 35, column: 5)
!32 = !DILocation(line: 37, column: 9, scope: !31)
!33 = !DILocation(line: 38, column: 9, scope: !31)
!34 = !DILocation(line: 38, column: 21, scope: !31)
!35 = !DILocation(line: 39, column: 5, scope: !31)
!36 = !DILocalVariable(name: "dest", scope: !37, file: !16, line: 41, type: !38)
!37 = distinct !DILexicalBlock(scope: !15, file: !16, line: 40, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 50)
!41 = !DILocation(line: 41, column: 17, scope: !37)
!42 = !DILocation(line: 43, column: 18, scope: !37)
!43 = !DILocation(line: 43, column: 31, scope: !37)
!44 = !DILocation(line: 43, column: 24, scope: !37)
!45 = !DILocation(line: 43, column: 45, scope: !37)
!46 = !DILocation(line: 43, column: 9, scope: !37)
!47 = !DILocation(line: 44, column: 20, scope: !37)
!48 = !DILocation(line: 44, column: 9, scope: !37)
!49 = !DILocation(line: 46, column: 1, scope: !15)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_10_good", scope: !16, file: !16, line: 97, type: !17, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 99, column: 5, scope: !50)
!52 = !DILocation(line: 100, column: 5, scope: !50)
!53 = !DILocation(line: 101, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 113, type: !55, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!7, !7, !57}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !16, line: 113, type: !7)
!61 = !DILocation(line: 113, column: 14, scope: !54)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !16, line: 113, type: !57)
!63 = !DILocation(line: 113, column: 27, scope: !54)
!64 = !DILocation(line: 116, column: 22, scope: !54)
!65 = !DILocation(line: 116, column: 12, scope: !54)
!66 = !DILocation(line: 116, column: 5, scope: !54)
!67 = !DILocation(line: 118, column: 5, scope: !54)
!68 = !DILocation(line: 119, column: 5, scope: !54)
!69 = !DILocation(line: 120, column: 5, scope: !54)
!70 = !DILocation(line: 123, column: 5, scope: !54)
!71 = !DILocation(line: 124, column: 5, scope: !54)
!72 = !DILocation(line: 125, column: 5, scope: !54)
!73 = !DILocation(line: 127, column: 5, scope: !54)
!74 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 53, type: !17, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !16, line: 55, type: !4)
!76 = !DILocation(line: 55, column: 15, scope: !74)
!77 = !DILocalVariable(name: "dataBuffer", scope: !74, file: !16, line: 56, type: !4)
!78 = !DILocation(line: 56, column: 15, scope: !74)
!79 = !DILocation(line: 56, column: 39, scope: !74)
!80 = !DILocation(line: 56, column: 28, scope: !74)
!81 = !DILocation(line: 57, column: 12, scope: !74)
!82 = !DILocation(line: 57, column: 10, scope: !74)
!83 = !DILocation(line: 58, column: 8, scope: !84)
!84 = distinct !DILexicalBlock(scope: !74, file: !16, line: 58, column: 8)
!85 = !DILocation(line: 58, column: 8, scope: !74)
!86 = !DILocation(line: 61, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !16, line: 59, column: 5)
!88 = !DILocation(line: 62, column: 5, scope: !87)
!89 = !DILocation(line: 66, column: 17, scope: !90)
!90 = distinct !DILexicalBlock(scope: !84, file: !16, line: 64, column: 5)
!91 = !DILocation(line: 66, column: 9, scope: !90)
!92 = !DILocation(line: 67, column: 9, scope: !90)
!93 = !DILocation(line: 67, column: 20, scope: !90)
!94 = !DILocalVariable(name: "dest", scope: !95, file: !16, line: 70, type: !38)
!95 = distinct !DILexicalBlock(scope: !74, file: !16, line: 69, column: 5)
!96 = !DILocation(line: 70, column: 17, scope: !95)
!97 = !DILocation(line: 72, column: 18, scope: !95)
!98 = !DILocation(line: 72, column: 31, scope: !95)
!99 = !DILocation(line: 72, column: 24, scope: !95)
!100 = !DILocation(line: 72, column: 45, scope: !95)
!101 = !DILocation(line: 72, column: 9, scope: !95)
!102 = !DILocation(line: 73, column: 20, scope: !95)
!103 = !DILocation(line: 73, column: 9, scope: !95)
!104 = !DILocation(line: 75, column: 1, scope: !74)
!105 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 78, type: !17, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocalVariable(name: "data", scope: !105, file: !16, line: 80, type: !4)
!107 = !DILocation(line: 80, column: 15, scope: !105)
!108 = !DILocalVariable(name: "dataBuffer", scope: !105, file: !16, line: 81, type: !4)
!109 = !DILocation(line: 81, column: 15, scope: !105)
!110 = !DILocation(line: 81, column: 39, scope: !105)
!111 = !DILocation(line: 81, column: 28, scope: !105)
!112 = !DILocation(line: 82, column: 12, scope: !105)
!113 = !DILocation(line: 82, column: 10, scope: !105)
!114 = !DILocation(line: 83, column: 8, scope: !115)
!115 = distinct !DILexicalBlock(scope: !105, file: !16, line: 83, column: 8)
!116 = !DILocation(line: 83, column: 8, scope: !105)
!117 = !DILocation(line: 86, column: 17, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !16, line: 84, column: 5)
!119 = !DILocation(line: 86, column: 9, scope: !118)
!120 = !DILocation(line: 87, column: 9, scope: !118)
!121 = !DILocation(line: 87, column: 20, scope: !118)
!122 = !DILocation(line: 88, column: 5, scope: !118)
!123 = !DILocalVariable(name: "dest", scope: !124, file: !16, line: 90, type: !38)
!124 = distinct !DILexicalBlock(scope: !105, file: !16, line: 89, column: 5)
!125 = !DILocation(line: 90, column: 17, scope: !124)
!126 = !DILocation(line: 92, column: 18, scope: !124)
!127 = !DILocation(line: 92, column: 31, scope: !124)
!128 = !DILocation(line: 92, column: 24, scope: !124)
!129 = !DILocation(line: 92, column: 45, scope: !124)
!130 = !DILocation(line: 92, column: 9, scope: !124)
!131 = !DILocation(line: 93, column: 20, scope: !124)
!132 = !DILocation(line: 93, column: 9, scope: !124)
!133 = !DILocation(line: 95, column: 1, scope: !105)
