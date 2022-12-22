; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncat_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncat_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncat_41_badSink(i32* %data) #0 !dbg !15 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !21, metadata !DIExpression()), !dbg !26
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !26
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !27
  %1 = load i32*, i32** %data.addr, align 8, !dbg !28
  %2 = load i32*, i32** %data.addr, align 8, !dbg !29
  %call = call i64 @wcslen(i32* %2) #6, !dbg !30
  %call1 = call i32* @wcsncat(i32* %arraydecay, i32* %1, i64 %call) #7, !dbg !31
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !32
  store i32 0, i32* %arrayidx, align 4, !dbg !33
  %3 = load i32*, i32** %data.addr, align 8, !dbg !34
  call void @printWLine(i32* %3), !dbg !35
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncat(i32*, i32*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncat_41_bad() #0 !dbg !37 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !42, metadata !DIExpression()), !dbg !43
  %0 = alloca i8, i64 400, align 16, !dbg !44
  %1 = bitcast i8* %0 to i32*, !dbg !45
  store i32* %1, i32** %dataBuffer, align 8, !dbg !43
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !46
  store i32* %2, i32** %data, align 8, !dbg !47
  %3 = load i32*, i32** %data, align 8, !dbg !48
  %call = call i32* @wmemset(i32* %3, i32 65, i64 99) #7, !dbg !49
  %4 = load i32*, i32** %data, align 8, !dbg !50
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !50
  store i32 0, i32* %arrayidx, align 4, !dbg !51
  %5 = load i32*, i32** %data, align 8, !dbg !52
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncat_41_badSink(i32* %5), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncat_41_goodG2BSink(i32* %data) #0 !dbg !55 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !58, metadata !DIExpression()), !dbg !60
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !60
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !60
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !61
  %1 = load i32*, i32** %data.addr, align 8, !dbg !62
  %2 = load i32*, i32** %data.addr, align 8, !dbg !63
  %call = call i64 @wcslen(i32* %2) #6, !dbg !64
  %call1 = call i32* @wcsncat(i32* %arraydecay, i32* %1, i64 %call) #7, !dbg !65
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !66
  store i32 0, i32* %arrayidx, align 4, !dbg !67
  %3 = load i32*, i32** %data.addr, align 8, !dbg !68
  call void @printWLine(i32* %3), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncat_41_good() #0 !dbg !71 {
entry:
  call void @goodG2B(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !74 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !80, metadata !DIExpression()), !dbg !81
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i64 @time(i64* null) #7, !dbg !84
  %conv = trunc i64 %call to i32, !dbg !85
  call void @srand(i32 %conv) #7, !dbg !86
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !87
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncat_41_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncat_41_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !94 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  %0 = alloca i8, i64 400, align 16, !dbg !99
  %1 = bitcast i8* %0 to i32*, !dbg !100
  store i32* %1, i32** %dataBuffer, align 8, !dbg !98
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !101
  store i32* %2, i32** %data, align 8, !dbg !102
  %3 = load i32*, i32** %data, align 8, !dbg !103
  %call = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !104
  %4 = load i32*, i32** %data, align 8, !dbg !105
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !105
  store i32 0, i32* %arrayidx, align 4, !dbg !106
  %5 = load i32*, i32** %data, align 8, !dbg !107
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncat_41_goodG2BSink(i32* %5), !dbg !108
  ret void, !dbg !109
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncat_41.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncat_41_badSink", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncat_41.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null, !4}
!19 = !DILocalVariable(name: "data", arg: 1, scope: !15, file: !16, line: 23, type: !4)
!20 = !DILocation(line: 23, column: 90, scope: !15)
!21 = !DILocalVariable(name: "dest", scope: !22, file: !16, line: 26, type: !23)
!22 = distinct !DILexicalBlock(scope: !15, file: !16, line: 25, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 50)
!26 = !DILocation(line: 26, column: 17, scope: !22)
!27 = !DILocation(line: 28, column: 17, scope: !22)
!28 = !DILocation(line: 28, column: 23, scope: !22)
!29 = !DILocation(line: 28, column: 36, scope: !22)
!30 = !DILocation(line: 28, column: 29, scope: !22)
!31 = !DILocation(line: 28, column: 9, scope: !22)
!32 = !DILocation(line: 29, column: 9, scope: !22)
!33 = !DILocation(line: 29, column: 20, scope: !22)
!34 = !DILocation(line: 30, column: 20, scope: !22)
!35 = !DILocation(line: 30, column: 9, scope: !22)
!36 = !DILocation(line: 32, column: 1, scope: !15)
!37 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncat_41_bad", scope: !16, file: !16, line: 34, type: !38, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DISubroutineType(types: !39)
!39 = !{null}
!40 = !DILocalVariable(name: "data", scope: !37, file: !16, line: 36, type: !4)
!41 = !DILocation(line: 36, column: 15, scope: !37)
!42 = !DILocalVariable(name: "dataBuffer", scope: !37, file: !16, line: 37, type: !4)
!43 = !DILocation(line: 37, column: 15, scope: !37)
!44 = !DILocation(line: 37, column: 39, scope: !37)
!45 = !DILocation(line: 37, column: 28, scope: !37)
!46 = !DILocation(line: 38, column: 12, scope: !37)
!47 = !DILocation(line: 38, column: 10, scope: !37)
!48 = !DILocation(line: 40, column: 13, scope: !37)
!49 = !DILocation(line: 40, column: 5, scope: !37)
!50 = !DILocation(line: 41, column: 5, scope: !37)
!51 = !DILocation(line: 41, column: 17, scope: !37)
!52 = !DILocation(line: 42, column: 79, scope: !37)
!53 = !DILocation(line: 42, column: 5, scope: !37)
!54 = !DILocation(line: 43, column: 1, scope: !37)
!55 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncat_41_goodG2BSink", scope: !16, file: !16, line: 49, type: !17, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocalVariable(name: "data", arg: 1, scope: !55, file: !16, line: 49, type: !4)
!57 = !DILocation(line: 49, column: 94, scope: !55)
!58 = !DILocalVariable(name: "dest", scope: !59, file: !16, line: 52, type: !23)
!59 = distinct !DILexicalBlock(scope: !55, file: !16, line: 51, column: 5)
!60 = !DILocation(line: 52, column: 17, scope: !59)
!61 = !DILocation(line: 54, column: 17, scope: !59)
!62 = !DILocation(line: 54, column: 23, scope: !59)
!63 = !DILocation(line: 54, column: 36, scope: !59)
!64 = !DILocation(line: 54, column: 29, scope: !59)
!65 = !DILocation(line: 54, column: 9, scope: !59)
!66 = !DILocation(line: 55, column: 9, scope: !59)
!67 = !DILocation(line: 55, column: 20, scope: !59)
!68 = !DILocation(line: 56, column: 20, scope: !59)
!69 = !DILocation(line: 56, column: 9, scope: !59)
!70 = !DILocation(line: 58, column: 1, scope: !55)
!71 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncat_41_good", scope: !16, file: !16, line: 72, type: !38, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocation(line: 74, column: 5, scope: !71)
!73 = !DILocation(line: 75, column: 1, scope: !71)
!74 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 87, type: !75, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!7, !7, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !16, line: 87, type: !7)
!81 = !DILocation(line: 87, column: 14, scope: !74)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !16, line: 87, type: !77)
!83 = !DILocation(line: 87, column: 27, scope: !74)
!84 = !DILocation(line: 90, column: 22, scope: !74)
!85 = !DILocation(line: 90, column: 12, scope: !74)
!86 = !DILocation(line: 90, column: 5, scope: !74)
!87 = !DILocation(line: 92, column: 5, scope: !74)
!88 = !DILocation(line: 93, column: 5, scope: !74)
!89 = !DILocation(line: 94, column: 5, scope: !74)
!90 = !DILocation(line: 97, column: 5, scope: !74)
!91 = !DILocation(line: 98, column: 5, scope: !74)
!92 = !DILocation(line: 99, column: 5, scope: !74)
!93 = !DILocation(line: 101, column: 5, scope: !74)
!94 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 61, type: !38, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "data", scope: !94, file: !16, line: 63, type: !4)
!96 = !DILocation(line: 63, column: 15, scope: !94)
!97 = !DILocalVariable(name: "dataBuffer", scope: !94, file: !16, line: 64, type: !4)
!98 = !DILocation(line: 64, column: 15, scope: !94)
!99 = !DILocation(line: 64, column: 39, scope: !94)
!100 = !DILocation(line: 64, column: 28, scope: !94)
!101 = !DILocation(line: 65, column: 12, scope: !94)
!102 = !DILocation(line: 65, column: 10, scope: !94)
!103 = !DILocation(line: 67, column: 13, scope: !94)
!104 = !DILocation(line: 67, column: 5, scope: !94)
!105 = !DILocation(line: 68, column: 5, scope: !94)
!106 = !DILocation(line: 68, column: 16, scope: !94)
!107 = !DILocation(line: 69, column: 83, scope: !94)
!108 = !DILocation(line: 69, column: 5, scope: !94)
!109 = !DILocation(line: 70, column: 1, scope: !94)
