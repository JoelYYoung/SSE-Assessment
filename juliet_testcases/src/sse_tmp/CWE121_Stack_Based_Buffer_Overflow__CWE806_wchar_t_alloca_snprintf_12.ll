; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_12_bad() #0 !dbg !15 {
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
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !27
  %tobool = icmp ne i32 %call, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.else, !dbg !29

if.then:                                          ; preds = %entry
  %3 = load i32*, i32** %data, align 8, !dbg !30
  %call1 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !32
  %4 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  br label %if.end, !dbg !35

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %data, align 8, !dbg !36
  %call2 = call i32* @wmemset(i32* %5, i32 65, i64 49) #6, !dbg !38
  %6 = load i32*, i32** %data, align 8, !dbg !39
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 49, !dbg !39
  store i32 0, i32* %arrayidx3, align 4, !dbg !40
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !41, metadata !DIExpression()), !dbg !46
  %7 = bitcast [50 x i32]* %dest to i8*, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 200, i1 false), !dbg !46
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !47
  %8 = load i32*, i32** %data, align 8, !dbg !48
  %call4 = call i64 @wcslen(i32* %8) #7, !dbg !49
  %9 = load i32*, i32** %data, align 8, !dbg !50
  %call5 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call4, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %9) #6, !dbg !51
  %10 = load i32*, i32** %data, align 8, !dbg !52
  call void @printWLine(i32* %10), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_12_good() #0 !dbg !55 {
entry:
  call void @goodG2B(), !dbg !56
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
  %call = call i64 @time(i64* null) #6, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #6, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_12_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_12_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !78 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %0 = alloca i8, i64 400, align 16, !dbg !83
  %1 = bitcast i8* %0 to i32*, !dbg !84
  store i32* %1, i32** %dataBuffer, align 8, !dbg !82
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !85
  store i32* %2, i32** %data, align 8, !dbg !86
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !87
  %tobool = icmp ne i32 %call, 0, !dbg !87
  br i1 %tobool, label %if.then, label %if.else, !dbg !89

if.then:                                          ; preds = %entry
  %3 = load i32*, i32** %data, align 8, !dbg !90
  %call1 = call i32* @wmemset(i32* %3, i32 65, i64 49) #6, !dbg !92
  %4 = load i32*, i32** %data, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !93
  store i32 0, i32* %arrayidx, align 4, !dbg !94
  br label %if.end, !dbg !95

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %data, align 8, !dbg !96
  %call2 = call i32* @wmemset(i32* %5, i32 65, i64 49) #6, !dbg !98
  %6 = load i32*, i32** %data, align 8, !dbg !99
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 49, !dbg !99
  store i32 0, i32* %arrayidx3, align 4, !dbg !100
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !101, metadata !DIExpression()), !dbg !103
  %7 = bitcast [50 x i32]* %dest to i8*, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 200, i1 false), !dbg !103
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !104
  %8 = load i32*, i32** %data, align 8, !dbg !105
  %call4 = call i64 @wcslen(i32* %8) #7, !dbg !106
  %9 = load i32*, i32** %data, align 8, !dbg !107
  %call5 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call4, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %9) #6, !dbg !108
  %10 = load i32*, i32** %data, align 8, !dbg !109
  call void @printWLine(i32* %10), !dbg !110
  ret void, !dbg !111
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_12.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_12_bad", scope: !16, file: !16, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_12.c", directory: "/root/SSE-Assessment")
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
!36 = !DILocation(line: 43, column: 17, scope: !37)
!37 = distinct !DILexicalBlock(scope: !28, file: !16, line: 41, column: 5)
!38 = !DILocation(line: 43, column: 9, scope: !37)
!39 = !DILocation(line: 44, column: 9, scope: !37)
!40 = !DILocation(line: 44, column: 20, scope: !37)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !16, line: 47, type: !43)
!42 = distinct !DILexicalBlock(scope: !15, file: !16, line: 46, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 50)
!46 = !DILocation(line: 47, column: 17, scope: !42)
!47 = !DILocation(line: 49, column: 18, scope: !42)
!48 = !DILocation(line: 49, column: 31, scope: !42)
!49 = !DILocation(line: 49, column: 24, scope: !42)
!50 = !DILocation(line: 49, column: 45, scope: !42)
!51 = !DILocation(line: 49, column: 9, scope: !42)
!52 = !DILocation(line: 50, column: 20, scope: !42)
!53 = !DILocation(line: 50, column: 9, scope: !42)
!54 = !DILocation(line: 52, column: 1, scope: !15)
!55 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_12_good", scope: !16, file: !16, line: 85, type: !17, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 87, column: 5, scope: !55)
!57 = !DILocation(line: 88, column: 1, scope: !55)
!58 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 100, type: !59, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!7, !7, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !16, line: 100, type: !7)
!65 = !DILocation(line: 100, column: 14, scope: !58)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !16, line: 100, type: !61)
!67 = !DILocation(line: 100, column: 27, scope: !58)
!68 = !DILocation(line: 103, column: 22, scope: !58)
!69 = !DILocation(line: 103, column: 12, scope: !58)
!70 = !DILocation(line: 103, column: 5, scope: !58)
!71 = !DILocation(line: 105, column: 5, scope: !58)
!72 = !DILocation(line: 106, column: 5, scope: !58)
!73 = !DILocation(line: 107, column: 5, scope: !58)
!74 = !DILocation(line: 110, column: 5, scope: !58)
!75 = !DILocation(line: 111, column: 5, scope: !58)
!76 = !DILocation(line: 112, column: 5, scope: !58)
!77 = !DILocation(line: 114, column: 5, scope: !58)
!78 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 60, type: !17, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !16, line: 62, type: !4)
!80 = !DILocation(line: 62, column: 15, scope: !78)
!81 = !DILocalVariable(name: "dataBuffer", scope: !78, file: !16, line: 63, type: !4)
!82 = !DILocation(line: 63, column: 15, scope: !78)
!83 = !DILocation(line: 63, column: 39, scope: !78)
!84 = !DILocation(line: 63, column: 28, scope: !78)
!85 = !DILocation(line: 64, column: 12, scope: !78)
!86 = !DILocation(line: 64, column: 10, scope: !78)
!87 = !DILocation(line: 65, column: 8, scope: !88)
!88 = distinct !DILexicalBlock(scope: !78, file: !16, line: 65, column: 8)
!89 = !DILocation(line: 65, column: 8, scope: !78)
!90 = !DILocation(line: 68, column: 17, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !16, line: 66, column: 5)
!92 = !DILocation(line: 68, column: 9, scope: !91)
!93 = !DILocation(line: 69, column: 9, scope: !91)
!94 = !DILocation(line: 69, column: 20, scope: !91)
!95 = !DILocation(line: 70, column: 5, scope: !91)
!96 = !DILocation(line: 74, column: 17, scope: !97)
!97 = distinct !DILexicalBlock(scope: !88, file: !16, line: 72, column: 5)
!98 = !DILocation(line: 74, column: 9, scope: !97)
!99 = !DILocation(line: 75, column: 9, scope: !97)
!100 = !DILocation(line: 75, column: 20, scope: !97)
!101 = !DILocalVariable(name: "dest", scope: !102, file: !16, line: 78, type: !43)
!102 = distinct !DILexicalBlock(scope: !78, file: !16, line: 77, column: 5)
!103 = !DILocation(line: 78, column: 17, scope: !102)
!104 = !DILocation(line: 80, column: 18, scope: !102)
!105 = !DILocation(line: 80, column: 31, scope: !102)
!106 = !DILocation(line: 80, column: 24, scope: !102)
!107 = !DILocation(line: 80, column: 45, scope: !102)
!108 = !DILocation(line: 80, column: 9, scope: !102)
!109 = !DILocation(line: 81, column: 20, scope: !102)
!110 = !DILocation(line: 81, column: 9, scope: !102)
!111 = !DILocation(line: 83, column: 1, scope: !78)
