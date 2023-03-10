; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_memcpy_31.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_memcpy_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_memcpy_31_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !23, metadata !DIExpression()), !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !26
  %0 = bitcast i8* %call to i32*, !dbg !27
  store i32* %0, i32** %dataBuffer, align 8, !dbg !25
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !28
  %cmp = icmp eq i32* %1, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !34
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !35
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !38
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !39
  store i32* %add.ptr, i32** %data, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !41, metadata !DIExpression()), !dbg !43
  %5 = load i32*, i32** %data, align 8, !dbg !44
  store i32* %5, i32** %dataCopy, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !45, metadata !DIExpression()), !dbg !46
  %6 = load i32*, i32** %dataCopy, align 8, !dbg !47
  store i32* %6, i32** %data2, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !48, metadata !DIExpression()), !dbg !53
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !54
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !55
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !56
  store i32 0, i32* %arrayidx4, align 4, !dbg !57
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !58
  %7 = bitcast i32* %arraydecay5 to i8*, !dbg !58
  %8 = load i32*, i32** %data2, align 8, !dbg !59
  %9 = bitcast i32* %8 to i8*, !dbg !58
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 4 %9, i64 400, i1 false), !dbg !58
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !60
  store i32 0, i32* %arrayidx6, align 4, !dbg !61
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !62
  call void @printWLine(i32* %arraydecay7), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_memcpy_31_good() #0 !dbg !65 {
entry:
  call void @goodG2B(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* null) #6, !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 %conv) #6, !dbg !80
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !81
  call void @CWE127_Buffer_Underread__malloc_wchar_t_memcpy_31_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !84
  call void @CWE127_Buffer_Underread__malloc_wchar_t_memcpy_31_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !88 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !89, metadata !DIExpression()), !dbg !90
  store i32* null, i32** %data, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !92, metadata !DIExpression()), !dbg !94
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !95
  %0 = bitcast i8* %call to i32*, !dbg !96
  store i32* %0, i32** %dataBuffer, align 8, !dbg !94
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !97
  %cmp = icmp eq i32* %1, null, !dbg !99
  br i1 %cmp, label %if.then, label %if.end, !dbg !100

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !101
  unreachable, !dbg !101

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !103
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !104
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !105
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !105
  store i32 0, i32* %arrayidx, align 4, !dbg !106
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !107
  store i32* %4, i32** %data, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !109, metadata !DIExpression()), !dbg !111
  %5 = load i32*, i32** %data, align 8, !dbg !112
  store i32* %5, i32** %dataCopy, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !113, metadata !DIExpression()), !dbg !114
  %6 = load i32*, i32** %dataCopy, align 8, !dbg !115
  store i32* %6, i32** %data2, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !116, metadata !DIExpression()), !dbg !118
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !119
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !120
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !121
  store i32 0, i32* %arrayidx4, align 4, !dbg !122
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !123
  %7 = bitcast i32* %arraydecay5 to i8*, !dbg !123
  %8 = load i32*, i32** %data2, align 8, !dbg !124
  %9 = bitcast i32* %8 to i8*, !dbg !123
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 4 %9, i64 400, i1 false), !dbg !123
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !125
  store i32 0, i32* %arrayidx6, align 4, !dbg !126
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !127
  call void @printWLine(i32* %arraydecay7), !dbg !128
  ret void, !dbg !129
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_memcpy_31.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_memcpy_31_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_memcpy_31.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocalVariable(name: "dataBuffer", scope: !24, file: !17, line: 28, type: !4)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 5)
!25 = !DILocation(line: 28, column: 19, scope: !24)
!26 = !DILocation(line: 28, column: 43, scope: !24)
!27 = !DILocation(line: 28, column: 32, scope: !24)
!28 = !DILocation(line: 29, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !24, file: !17, line: 29, column: 13)
!30 = !DILocation(line: 29, column: 24, scope: !29)
!31 = !DILocation(line: 29, column: 13, scope: !24)
!32 = !DILocation(line: 29, column: 34, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !17, line: 29, column: 33)
!34 = !DILocation(line: 30, column: 17, scope: !24)
!35 = !DILocation(line: 30, column: 9, scope: !24)
!36 = !DILocation(line: 31, column: 9, scope: !24)
!37 = !DILocation(line: 31, column: 27, scope: !24)
!38 = !DILocation(line: 33, column: 16, scope: !24)
!39 = !DILocation(line: 33, column: 27, scope: !24)
!40 = !DILocation(line: 33, column: 14, scope: !24)
!41 = !DILocalVariable(name: "dataCopy", scope: !42, file: !17, line: 36, type: !4)
!42 = distinct !DILexicalBlock(scope: !16, file: !17, line: 35, column: 5)
!43 = !DILocation(line: 36, column: 19, scope: !42)
!44 = !DILocation(line: 36, column: 30, scope: !42)
!45 = !DILocalVariable(name: "data", scope: !42, file: !17, line: 37, type: !4)
!46 = !DILocation(line: 37, column: 19, scope: !42)
!47 = !DILocation(line: 37, column: 26, scope: !42)
!48 = !DILocalVariable(name: "dest", scope: !49, file: !17, line: 39, type: !50)
!49 = distinct !DILexicalBlock(scope: !42, file: !17, line: 38, column: 9)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 100)
!53 = !DILocation(line: 39, column: 21, scope: !49)
!54 = !DILocation(line: 40, column: 21, scope: !49)
!55 = !DILocation(line: 40, column: 13, scope: !49)
!56 = !DILocation(line: 41, column: 13, scope: !49)
!57 = !DILocation(line: 41, column: 25, scope: !49)
!58 = !DILocation(line: 43, column: 13, scope: !49)
!59 = !DILocation(line: 43, column: 26, scope: !49)
!60 = !DILocation(line: 45, column: 13, scope: !49)
!61 = !DILocation(line: 45, column: 25, scope: !49)
!62 = !DILocation(line: 46, column: 24, scope: !49)
!63 = !DILocation(line: 46, column: 13, scope: !49)
!64 = !DILocation(line: 51, column: 1, scope: !16)
!65 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_memcpy_31_good", scope: !17, file: !17, line: 88, type: !18, scopeLine: 89, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocation(line: 90, column: 5, scope: !65)
!67 = !DILocation(line: 91, column: 1, scope: !65)
!68 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 102, type: !69, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!7, !7, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !17, line: 102, type: !7)
!75 = !DILocation(line: 102, column: 14, scope: !68)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !17, line: 102, type: !71)
!77 = !DILocation(line: 102, column: 27, scope: !68)
!78 = !DILocation(line: 105, column: 22, scope: !68)
!79 = !DILocation(line: 105, column: 12, scope: !68)
!80 = !DILocation(line: 105, column: 5, scope: !68)
!81 = !DILocation(line: 107, column: 5, scope: !68)
!82 = !DILocation(line: 108, column: 5, scope: !68)
!83 = !DILocation(line: 109, column: 5, scope: !68)
!84 = !DILocation(line: 112, column: 5, scope: !68)
!85 = !DILocation(line: 113, column: 5, scope: !68)
!86 = !DILocation(line: 114, column: 5, scope: !68)
!87 = !DILocation(line: 116, column: 5, scope: !68)
!88 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 58, type: !18, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocalVariable(name: "data", scope: !88, file: !17, line: 60, type: !4)
!90 = !DILocation(line: 60, column: 15, scope: !88)
!91 = !DILocation(line: 61, column: 10, scope: !88)
!92 = !DILocalVariable(name: "dataBuffer", scope: !93, file: !17, line: 63, type: !4)
!93 = distinct !DILexicalBlock(scope: !88, file: !17, line: 62, column: 5)
!94 = !DILocation(line: 63, column: 19, scope: !93)
!95 = !DILocation(line: 63, column: 43, scope: !93)
!96 = !DILocation(line: 63, column: 32, scope: !93)
!97 = !DILocation(line: 64, column: 13, scope: !98)
!98 = distinct !DILexicalBlock(scope: !93, file: !17, line: 64, column: 13)
!99 = !DILocation(line: 64, column: 24, scope: !98)
!100 = !DILocation(line: 64, column: 13, scope: !93)
!101 = !DILocation(line: 64, column: 34, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !17, line: 64, column: 33)
!103 = !DILocation(line: 65, column: 17, scope: !93)
!104 = !DILocation(line: 65, column: 9, scope: !93)
!105 = !DILocation(line: 66, column: 9, scope: !93)
!106 = !DILocation(line: 66, column: 27, scope: !93)
!107 = !DILocation(line: 68, column: 16, scope: !93)
!108 = !DILocation(line: 68, column: 14, scope: !93)
!109 = !DILocalVariable(name: "dataCopy", scope: !110, file: !17, line: 71, type: !4)
!110 = distinct !DILexicalBlock(scope: !88, file: !17, line: 70, column: 5)
!111 = !DILocation(line: 71, column: 19, scope: !110)
!112 = !DILocation(line: 71, column: 30, scope: !110)
!113 = !DILocalVariable(name: "data", scope: !110, file: !17, line: 72, type: !4)
!114 = !DILocation(line: 72, column: 19, scope: !110)
!115 = !DILocation(line: 72, column: 26, scope: !110)
!116 = !DILocalVariable(name: "dest", scope: !117, file: !17, line: 74, type: !50)
!117 = distinct !DILexicalBlock(scope: !110, file: !17, line: 73, column: 9)
!118 = !DILocation(line: 74, column: 21, scope: !117)
!119 = !DILocation(line: 75, column: 21, scope: !117)
!120 = !DILocation(line: 75, column: 13, scope: !117)
!121 = !DILocation(line: 76, column: 13, scope: !117)
!122 = !DILocation(line: 76, column: 25, scope: !117)
!123 = !DILocation(line: 78, column: 13, scope: !117)
!124 = !DILocation(line: 78, column: 26, scope: !117)
!125 = !DILocation(line: 80, column: 13, scope: !117)
!126 = !DILocation(line: 80, column: 25, scope: !117)
!127 = !DILocation(line: 81, column: 24, scope: !117)
!128 = !DILocation(line: 81, column: 13, scope: !117)
!129 = !DILocation(line: 86, column: 1, scope: !88)
