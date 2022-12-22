; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_31.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_31_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  %call = call noalias align 16 i8* @malloc(i64 400) #8, !dbg !22
  %0 = bitcast i8* %call to i32*, !dbg !23
  store i32* %0, i32** %data, align 8, !dbg !24
  %1 = load i32*, i32** %data, align 8, !dbg !25
  %cmp = icmp eq i32* %1, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !31
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #8, !dbg !32
  %3 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !35, metadata !DIExpression()), !dbg !37
  %4 = load i32*, i32** %data, align 8, !dbg !38
  store i32* %4, i32** %dataCopy, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !39, metadata !DIExpression()), !dbg !40
  %5 = load i32*, i32** %dataCopy, align 8, !dbg !41
  store i32* %5, i32** %data2, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !42, metadata !DIExpression()), !dbg !47
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !47
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !48
  %7 = bitcast i32* %arraydecay to i8*, !dbg !48
  %8 = load i32*, i32** %data2, align 8, !dbg !49
  %9 = bitcast i32* %8 to i8*, !dbg !48
  %10 = load i32*, i32** %data2, align 8, !dbg !50
  %call3 = call i64 @wcslen(i32* %10) #10, !dbg !51
  %mul = mul i64 %call3, 4, !dbg !52
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 4 %9, i64 %mul, i1 false), !dbg !48
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !53
  store i32 0, i32* %arrayidx4, align 4, !dbg !54
  %11 = load i32*, i32** %data2, align 8, !dbg !55
  call void @printWLine(i32* %11), !dbg !56
  %12 = load i32*, i32** %data2, align 8, !dbg !57
  %13 = bitcast i32* %12 to i8*, !dbg !57
  call void @free(i8* %13) #8, !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #6

declare dso_local void @printWLine(i32*) #7

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_31_good() #0 !dbg !60 {
entry:
  call void @goodG2B(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #8, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #8, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_31_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_31_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #7

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !83 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call noalias align 16 i8* @malloc(i64 400) #8, !dbg !86
  %0 = bitcast i8* %call to i32*, !dbg !87
  store i32* %0, i32** %data, align 8, !dbg !88
  %1 = load i32*, i32** %data, align 8, !dbg !89
  %cmp = icmp eq i32* %1, null, !dbg !91
  br i1 %cmp, label %if.then, label %if.end, !dbg !92

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !93
  unreachable, !dbg !93

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !95
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #8, !dbg !96
  %3 = load i32*, i32** %data, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !97
  store i32 0, i32* %arrayidx, align 4, !dbg !98
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !99, metadata !DIExpression()), !dbg !101
  %4 = load i32*, i32** %data, align 8, !dbg !102
  store i32* %4, i32** %dataCopy, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !103, metadata !DIExpression()), !dbg !104
  %5 = load i32*, i32** %dataCopy, align 8, !dbg !105
  store i32* %5, i32** %data2, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !106, metadata !DIExpression()), !dbg !108
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !108
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !109
  %7 = bitcast i32* %arraydecay to i8*, !dbg !109
  %8 = load i32*, i32** %data2, align 8, !dbg !110
  %9 = bitcast i32* %8 to i8*, !dbg !109
  %10 = load i32*, i32** %data2, align 8, !dbg !111
  %call3 = call i64 @wcslen(i32* %10) #10, !dbg !112
  %mul = mul i64 %call3, 4, !dbg !113
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 4 %9, i64 %mul, i1 false), !dbg !109
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !114
  store i32 0, i32* %arrayidx4, align 4, !dbg !115
  %11 = load i32*, i32** %data2, align 8, !dbg !116
  call void @printWLine(i32* %11), !dbg !117
  %12 = load i32*, i32** %data2, align 8, !dbg !118
  %13 = bitcast i32* %12 to i8*, !dbg !118
  call void @free(i8* %13) #8, !dbg !119
  ret void, !dbg !120
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { argmemonly nofree nounwind willreturn }
attributes #7 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_31.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_31_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_31.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 23, scope: !16)
!23 = !DILocation(line: 26, column: 12, scope: !16)
!24 = !DILocation(line: 26, column: 10, scope: !16)
!25 = !DILocation(line: 27, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 9)
!27 = !DILocation(line: 27, column: 14, scope: !26)
!28 = !DILocation(line: 27, column: 9, scope: !16)
!29 = !DILocation(line: 27, column: 24, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !17, line: 27, column: 23)
!31 = !DILocation(line: 29, column: 13, scope: !16)
!32 = !DILocation(line: 29, column: 5, scope: !16)
!33 = !DILocation(line: 30, column: 5, scope: !16)
!34 = !DILocation(line: 30, column: 17, scope: !16)
!35 = !DILocalVariable(name: "dataCopy", scope: !36, file: !17, line: 32, type: !4)
!36 = distinct !DILexicalBlock(scope: !16, file: !17, line: 31, column: 5)
!37 = !DILocation(line: 32, column: 19, scope: !36)
!38 = !DILocation(line: 32, column: 30, scope: !36)
!39 = !DILocalVariable(name: "data", scope: !36, file: !17, line: 33, type: !4)
!40 = !DILocation(line: 33, column: 19, scope: !36)
!41 = !DILocation(line: 33, column: 26, scope: !36)
!42 = !DILocalVariable(name: "dest", scope: !43, file: !17, line: 35, type: !44)
!43 = distinct !DILexicalBlock(scope: !36, file: !17, line: 34, column: 9)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 50)
!47 = !DILocation(line: 35, column: 21, scope: !43)
!48 = !DILocation(line: 37, column: 13, scope: !43)
!49 = !DILocation(line: 37, column: 26, scope: !43)
!50 = !DILocation(line: 37, column: 39, scope: !43)
!51 = !DILocation(line: 37, column: 32, scope: !43)
!52 = !DILocation(line: 37, column: 44, scope: !43)
!53 = !DILocation(line: 38, column: 13, scope: !43)
!54 = !DILocation(line: 38, column: 24, scope: !43)
!55 = !DILocation(line: 39, column: 24, scope: !43)
!56 = !DILocation(line: 39, column: 13, scope: !43)
!57 = !DILocation(line: 40, column: 18, scope: !43)
!58 = !DILocation(line: 40, column: 13, scope: !43)
!59 = !DILocation(line: 43, column: 1, scope: !16)
!60 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_31_good", scope: !17, file: !17, line: 72, type: !18, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 74, column: 5, scope: !60)
!62 = !DILocation(line: 75, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 86, type: !64, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!7, !7, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !17, line: 86, type: !7)
!70 = !DILocation(line: 86, column: 14, scope: !63)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !17, line: 86, type: !66)
!72 = !DILocation(line: 86, column: 27, scope: !63)
!73 = !DILocation(line: 89, column: 22, scope: !63)
!74 = !DILocation(line: 89, column: 12, scope: !63)
!75 = !DILocation(line: 89, column: 5, scope: !63)
!76 = !DILocation(line: 91, column: 5, scope: !63)
!77 = !DILocation(line: 92, column: 5, scope: !63)
!78 = !DILocation(line: 93, column: 5, scope: !63)
!79 = !DILocation(line: 96, column: 5, scope: !63)
!80 = !DILocation(line: 97, column: 5, scope: !63)
!81 = !DILocation(line: 98, column: 5, scope: !63)
!82 = !DILocation(line: 100, column: 5, scope: !63)
!83 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 50, type: !18, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "data", scope: !83, file: !17, line: 52, type: !4)
!85 = !DILocation(line: 52, column: 15, scope: !83)
!86 = !DILocation(line: 53, column: 23, scope: !83)
!87 = !DILocation(line: 53, column: 12, scope: !83)
!88 = !DILocation(line: 53, column: 10, scope: !83)
!89 = !DILocation(line: 54, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !83, file: !17, line: 54, column: 9)
!91 = !DILocation(line: 54, column: 14, scope: !90)
!92 = !DILocation(line: 54, column: 9, scope: !83)
!93 = !DILocation(line: 54, column: 24, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !17, line: 54, column: 23)
!95 = !DILocation(line: 56, column: 13, scope: !83)
!96 = !DILocation(line: 56, column: 5, scope: !83)
!97 = !DILocation(line: 57, column: 5, scope: !83)
!98 = !DILocation(line: 57, column: 16, scope: !83)
!99 = !DILocalVariable(name: "dataCopy", scope: !100, file: !17, line: 59, type: !4)
!100 = distinct !DILexicalBlock(scope: !83, file: !17, line: 58, column: 5)
!101 = !DILocation(line: 59, column: 19, scope: !100)
!102 = !DILocation(line: 59, column: 30, scope: !100)
!103 = !DILocalVariable(name: "data", scope: !100, file: !17, line: 60, type: !4)
!104 = !DILocation(line: 60, column: 19, scope: !100)
!105 = !DILocation(line: 60, column: 26, scope: !100)
!106 = !DILocalVariable(name: "dest", scope: !107, file: !17, line: 62, type: !44)
!107 = distinct !DILexicalBlock(scope: !100, file: !17, line: 61, column: 9)
!108 = !DILocation(line: 62, column: 21, scope: !107)
!109 = !DILocation(line: 64, column: 13, scope: !107)
!110 = !DILocation(line: 64, column: 26, scope: !107)
!111 = !DILocation(line: 64, column: 39, scope: !107)
!112 = !DILocation(line: 64, column: 32, scope: !107)
!113 = !DILocation(line: 64, column: 44, scope: !107)
!114 = !DILocation(line: 65, column: 13, scope: !107)
!115 = !DILocation(line: 65, column: 24, scope: !107)
!116 = !DILocation(line: 66, column: 24, scope: !107)
!117 = !DILocation(line: 66, column: 13, scope: !107)
!118 = !DILocation(line: 67, column: 18, scope: !107)
!119 = !DILocation(line: 67, column: 13, scope: !107)
!120 = !DILocation(line: 70, column: 1, scope: !83)
