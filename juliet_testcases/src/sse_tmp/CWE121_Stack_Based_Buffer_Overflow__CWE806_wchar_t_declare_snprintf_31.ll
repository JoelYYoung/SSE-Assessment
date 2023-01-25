; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_31_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  store i32* %arraydecay, i32** %data, align 8, !dbg !27
  %0 = load i32*, i32** %data, align 8, !dbg !28
  %call = call i32* @wmemset(i32* %0, i32 65, i64 99) #6, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !30
  store i32 0, i32* %arrayidx, align 4, !dbg !31
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !32, metadata !DIExpression()), !dbg !34
  %2 = load i32*, i32** %data, align 8, !dbg !35
  store i32* %2, i32** %dataCopy, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !36, metadata !DIExpression()), !dbg !37
  %3 = load i32*, i32** %dataCopy, align 8, !dbg !38
  store i32* %3, i32** %data1, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !39, metadata !DIExpression()), !dbg !44
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !44
  %arraydecay2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !45
  %5 = load i32*, i32** %data1, align 8, !dbg !46
  %call3 = call i64 @wcslen(i32* %5) #7, !dbg !47
  %6 = load i32*, i32** %data1, align 8, !dbg !48
  %call4 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay2, i64 %call3, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %6) #6, !dbg !49
  %7 = load i32*, i32** %data1, align 8, !dbg !50
  call void @printWLine(i32* %7), !dbg !51
  ret void, !dbg !52
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_31_good() #0 !dbg !53 {
entry:
  call void @goodG2B(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #6, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #6, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_31_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_31_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !76 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !81
  store i32* %arraydecay, i32** %data, align 8, !dbg !82
  %0 = load i32*, i32** %data, align 8, !dbg !83
  %call = call i32* @wmemset(i32* %0, i32 65, i64 49) #6, !dbg !84
  %1 = load i32*, i32** %data, align 8, !dbg !85
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !85
  store i32 0, i32* %arrayidx, align 4, !dbg !86
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !87, metadata !DIExpression()), !dbg !89
  %2 = load i32*, i32** %data, align 8, !dbg !90
  store i32* %2, i32** %dataCopy, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !91, metadata !DIExpression()), !dbg !92
  %3 = load i32*, i32** %dataCopy, align 8, !dbg !93
  store i32* %3, i32** %data1, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !94, metadata !DIExpression()), !dbg !96
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !96
  %arraydecay2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !97
  %5 = load i32*, i32** %data1, align 8, !dbg !98
  %call3 = call i64 @wcslen(i32* %5) #7, !dbg !99
  %6 = load i32*, i32** %data1, align 8, !dbg !100
  %call4 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay2, i64 %call3, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %6) #6, !dbg !101
  %7 = load i32*, i32** %data1, align 8, !dbg !102
  call void @printWLine(i32* %7), !dbg !103
  ret void, !dbg !104
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
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_31.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_31_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_31.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 31, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 32, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 32, column: 13, scope: !11)
!26 = !DILocation(line: 33, column: 12, scope: !11)
!27 = !DILocation(line: 33, column: 10, scope: !11)
!28 = !DILocation(line: 35, column: 13, scope: !11)
!29 = !DILocation(line: 35, column: 5, scope: !11)
!30 = !DILocation(line: 36, column: 5, scope: !11)
!31 = !DILocation(line: 36, column: 17, scope: !11)
!32 = !DILocalVariable(name: "dataCopy", scope: !33, file: !12, line: 38, type: !16)
!33 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!34 = !DILocation(line: 38, column: 19, scope: !33)
!35 = !DILocation(line: 38, column: 30, scope: !33)
!36 = !DILocalVariable(name: "data", scope: !33, file: !12, line: 39, type: !16)
!37 = !DILocation(line: 39, column: 19, scope: !33)
!38 = !DILocation(line: 39, column: 26, scope: !33)
!39 = !DILocalVariable(name: "dest", scope: !40, file: !12, line: 41, type: !41)
!40 = distinct !DILexicalBlock(scope: !33, file: !12, line: 40, column: 9)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 50)
!44 = !DILocation(line: 41, column: 21, scope: !40)
!45 = !DILocation(line: 43, column: 22, scope: !40)
!46 = !DILocation(line: 43, column: 35, scope: !40)
!47 = !DILocation(line: 43, column: 28, scope: !40)
!48 = !DILocation(line: 43, column: 49, scope: !40)
!49 = !DILocation(line: 43, column: 13, scope: !40)
!50 = !DILocation(line: 44, column: 24, scope: !40)
!51 = !DILocation(line: 44, column: 13, scope: !40)
!52 = !DILocation(line: 47, column: 1, scope: !11)
!53 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_31_good", scope: !12, file: !12, line: 74, type: !13, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 76, column: 5, scope: !53)
!55 = !DILocation(line: 77, column: 1, scope: !53)
!56 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 88, type: !57, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!19, !19, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !12, line: 88, type: !19)
!63 = !DILocation(line: 88, column: 14, scope: !56)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !12, line: 88, type: !59)
!65 = !DILocation(line: 88, column: 27, scope: !56)
!66 = !DILocation(line: 91, column: 22, scope: !56)
!67 = !DILocation(line: 91, column: 12, scope: !56)
!68 = !DILocation(line: 91, column: 5, scope: !56)
!69 = !DILocation(line: 93, column: 5, scope: !56)
!70 = !DILocation(line: 94, column: 5, scope: !56)
!71 = !DILocation(line: 95, column: 5, scope: !56)
!72 = !DILocation(line: 98, column: 5, scope: !56)
!73 = !DILocation(line: 99, column: 5, scope: !56)
!74 = !DILocation(line: 100, column: 5, scope: !56)
!75 = !DILocation(line: 102, column: 5, scope: !56)
!76 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !12, line: 56, type: !16)
!78 = !DILocation(line: 56, column: 15, scope: !76)
!79 = !DILocalVariable(name: "dataBuffer", scope: !76, file: !12, line: 57, type: !22)
!80 = !DILocation(line: 57, column: 13, scope: !76)
!81 = !DILocation(line: 58, column: 12, scope: !76)
!82 = !DILocation(line: 58, column: 10, scope: !76)
!83 = !DILocation(line: 60, column: 13, scope: !76)
!84 = !DILocation(line: 60, column: 5, scope: !76)
!85 = !DILocation(line: 61, column: 5, scope: !76)
!86 = !DILocation(line: 61, column: 16, scope: !76)
!87 = !DILocalVariable(name: "dataCopy", scope: !88, file: !12, line: 63, type: !16)
!88 = distinct !DILexicalBlock(scope: !76, file: !12, line: 62, column: 5)
!89 = !DILocation(line: 63, column: 19, scope: !88)
!90 = !DILocation(line: 63, column: 30, scope: !88)
!91 = !DILocalVariable(name: "data", scope: !88, file: !12, line: 64, type: !16)
!92 = !DILocation(line: 64, column: 19, scope: !88)
!93 = !DILocation(line: 64, column: 26, scope: !88)
!94 = !DILocalVariable(name: "dest", scope: !95, file: !12, line: 66, type: !41)
!95 = distinct !DILexicalBlock(scope: !88, file: !12, line: 65, column: 9)
!96 = !DILocation(line: 66, column: 21, scope: !95)
!97 = !DILocation(line: 68, column: 22, scope: !95)
!98 = !DILocation(line: 68, column: 35, scope: !95)
!99 = !DILocation(line: 68, column: 28, scope: !95)
!100 = !DILocation(line: 68, column: 49, scope: !95)
!101 = !DILocation(line: 68, column: 13, scope: !95)
!102 = !DILocation(line: 69, column: 24, scope: !95)
!103 = !DILocation(line: 69, column: 13, scope: !95)
!104 = !DILocation(line: 72, column: 1, scope: !76)
