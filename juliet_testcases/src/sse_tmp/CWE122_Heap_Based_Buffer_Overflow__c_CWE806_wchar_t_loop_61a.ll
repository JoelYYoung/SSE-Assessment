; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_61a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_61_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !21
  %0 = bitcast i8* %call to i32*, !dbg !22
  store i32* %0, i32** %data, align 8, !dbg !23
  %1 = load i32*, i32** %data, align 8, !dbg !24
  %call1 = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_61b_badSource(i32* %1), !dbg !25
  store i32* %call1, i32** %data, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !27, metadata !DIExpression()), !dbg !32
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !32
  call void @llvm.dbg.declare(metadata i64* %i, metadata !33, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !37, metadata !DIExpression()), !dbg !38
  %3 = load i32*, i32** %data, align 8, !dbg !39
  %call2 = call i64 @wcslen(i32* %3) #7, !dbg !40
  store i64 %call2, i64* %dataLen, align 8, !dbg !41
  store i64 0, i64* %i, align 8, !dbg !42
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !45
  %5 = load i64, i64* %dataLen, align 8, !dbg !47
  %cmp = icmp ult i64 %4, %5, !dbg !48
  br i1 %cmp, label %for.body, label %for.end, !dbg !49

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !50
  %7 = load i64, i64* %i, align 8, !dbg !52
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !50
  %8 = load i32, i32* %arrayidx, align 4, !dbg !50
  %9 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %9, !dbg !54
  store i32 %8, i32* %arrayidx3, align 4, !dbg !55
  br label %for.inc, !dbg !56

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !57
  %inc = add i64 %10, 1, !dbg !57
  store i64 %inc, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !58, !llvm.loop !59

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !62
  store i32 0, i32* %arrayidx4, align 4, !dbg !63
  %11 = load i32*, i32** %data, align 8, !dbg !64
  call void @printWLine(i32* %11), !dbg !65
  %12 = load i32*, i32** %data, align 8, !dbg !66
  %13 = bitcast i32* %12 to i8*, !dbg !66
  call void @free(i8* %13) #6, !dbg !67
  ret void, !dbg !68
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_61b_badSource(i32*) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_61_good() #0 !dbg !69 {
entry:
  call void @goodG2B(), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !72 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i64 @time(i64* null) #6, !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 %conv) #6, !dbg !84
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !85
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_61_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_61_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !92 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !95
  %0 = bitcast i8* %call to i32*, !dbg !96
  store i32* %0, i32** %data, align 8, !dbg !97
  %1 = load i32*, i32** %data, align 8, !dbg !98
  %call1 = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_61b_goodG2BSource(i32* %1), !dbg !99
  store i32* %call1, i32** %data, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !101, metadata !DIExpression()), !dbg !103
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !103
  call void @llvm.dbg.declare(metadata i64* %i, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !106, metadata !DIExpression()), !dbg !107
  %3 = load i32*, i32** %data, align 8, !dbg !108
  %call2 = call i64 @wcslen(i32* %3) #7, !dbg !109
  store i64 %call2, i64* %dataLen, align 8, !dbg !110
  store i64 0, i64* %i, align 8, !dbg !111
  br label %for.cond, !dbg !113

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !114
  %5 = load i64, i64* %dataLen, align 8, !dbg !116
  %cmp = icmp ult i64 %4, %5, !dbg !117
  br i1 %cmp, label %for.body, label %for.end, !dbg !118

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !119
  %7 = load i64, i64* %i, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !119
  %8 = load i32, i32* %arrayidx, align 4, !dbg !119
  %9 = load i64, i64* %i, align 8, !dbg !122
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %9, !dbg !123
  store i32 %8, i32* %arrayidx3, align 4, !dbg !124
  br label %for.inc, !dbg !125

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !126
  %inc = add i64 %10, 1, !dbg !126
  store i64 %inc, i64* %i, align 8, !dbg !126
  br label %for.cond, !dbg !127, !llvm.loop !128

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !130
  store i32 0, i32* %arrayidx4, align 4, !dbg !131
  %11 = load i32*, i32** %data, align 8, !dbg !132
  call void @printWLine(i32* %11), !dbg !133
  %12 = load i32*, i32** %data, align 8, !dbg !134
  %13 = bitcast i32* %12 to i8*, !dbg !134
  call void @free(i8* %13) #6, !dbg !135
  ret void, !dbg !136
}

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_61b_goodG2BSource(i32*) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_61a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_61_bad", scope: !16, file: !16, line: 26, type: !17, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_61a.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 28, type: !4)
!20 = !DILocation(line: 28, column: 15, scope: !15)
!21 = !DILocation(line: 29, column: 23, scope: !15)
!22 = !DILocation(line: 29, column: 12, scope: !15)
!23 = !DILocation(line: 29, column: 10, scope: !15)
!24 = !DILocation(line: 30, column: 83, scope: !15)
!25 = !DILocation(line: 30, column: 12, scope: !15)
!26 = !DILocation(line: 30, column: 10, scope: !15)
!27 = !DILocalVariable(name: "dest", scope: !28, file: !16, line: 32, type: !29)
!28 = distinct !DILexicalBlock(scope: !15, file: !16, line: 31, column: 5)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 50)
!32 = !DILocation(line: 32, column: 17, scope: !28)
!33 = !DILocalVariable(name: "i", scope: !28, file: !16, line: 33, type: !34)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !35)
!35 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!36 = !DILocation(line: 33, column: 16, scope: !28)
!37 = !DILocalVariable(name: "dataLen", scope: !28, file: !16, line: 33, type: !34)
!38 = !DILocation(line: 33, column: 19, scope: !28)
!39 = !DILocation(line: 34, column: 26, scope: !28)
!40 = !DILocation(line: 34, column: 19, scope: !28)
!41 = !DILocation(line: 34, column: 17, scope: !28)
!42 = !DILocation(line: 36, column: 16, scope: !43)
!43 = distinct !DILexicalBlock(scope: !28, file: !16, line: 36, column: 9)
!44 = !DILocation(line: 36, column: 14, scope: !43)
!45 = !DILocation(line: 36, column: 21, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !16, line: 36, column: 9)
!47 = !DILocation(line: 36, column: 25, scope: !46)
!48 = !DILocation(line: 36, column: 23, scope: !46)
!49 = !DILocation(line: 36, column: 9, scope: !43)
!50 = !DILocation(line: 38, column: 23, scope: !51)
!51 = distinct !DILexicalBlock(scope: !46, file: !16, line: 37, column: 9)
!52 = !DILocation(line: 38, column: 28, scope: !51)
!53 = !DILocation(line: 38, column: 18, scope: !51)
!54 = !DILocation(line: 38, column: 13, scope: !51)
!55 = !DILocation(line: 38, column: 21, scope: !51)
!56 = !DILocation(line: 39, column: 9, scope: !51)
!57 = !DILocation(line: 36, column: 35, scope: !46)
!58 = !DILocation(line: 36, column: 9, scope: !46)
!59 = distinct !{!59, !49, !60, !61}
!60 = !DILocation(line: 39, column: 9, scope: !43)
!61 = !{!"llvm.loop.mustprogress"}
!62 = !DILocation(line: 40, column: 9, scope: !28)
!63 = !DILocation(line: 40, column: 20, scope: !28)
!64 = !DILocation(line: 41, column: 20, scope: !28)
!65 = !DILocation(line: 41, column: 9, scope: !28)
!66 = !DILocation(line: 42, column: 14, scope: !28)
!67 = !DILocation(line: 42, column: 9, scope: !28)
!68 = !DILocation(line: 44, column: 1, scope: !15)
!69 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_61_good", scope: !16, file: !16, line: 73, type: !17, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocation(line: 75, column: 5, scope: !69)
!71 = !DILocation(line: 76, column: 1, scope: !69)
!72 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 88, type: !73, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DISubroutineType(types: !74)
!74 = !{!7, !7, !75}
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !16, line: 88, type: !7)
!79 = !DILocation(line: 88, column: 14, scope: !72)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !16, line: 88, type: !75)
!81 = !DILocation(line: 88, column: 27, scope: !72)
!82 = !DILocation(line: 91, column: 22, scope: !72)
!83 = !DILocation(line: 91, column: 12, scope: !72)
!84 = !DILocation(line: 91, column: 5, scope: !72)
!85 = !DILocation(line: 93, column: 5, scope: !72)
!86 = !DILocation(line: 94, column: 5, scope: !72)
!87 = !DILocation(line: 95, column: 5, scope: !72)
!88 = !DILocation(line: 98, column: 5, scope: !72)
!89 = !DILocation(line: 99, column: 5, scope: !72)
!90 = !DILocation(line: 100, column: 5, scope: !72)
!91 = !DILocation(line: 102, column: 5, scope: !72)
!92 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 53, type: !17, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocalVariable(name: "data", scope: !92, file: !16, line: 55, type: !4)
!94 = !DILocation(line: 55, column: 15, scope: !92)
!95 = !DILocation(line: 56, column: 23, scope: !92)
!96 = !DILocation(line: 56, column: 12, scope: !92)
!97 = !DILocation(line: 56, column: 10, scope: !92)
!98 = !DILocation(line: 57, column: 87, scope: !92)
!99 = !DILocation(line: 57, column: 12, scope: !92)
!100 = !DILocation(line: 57, column: 10, scope: !92)
!101 = !DILocalVariable(name: "dest", scope: !102, file: !16, line: 59, type: !29)
!102 = distinct !DILexicalBlock(scope: !92, file: !16, line: 58, column: 5)
!103 = !DILocation(line: 59, column: 17, scope: !102)
!104 = !DILocalVariable(name: "i", scope: !102, file: !16, line: 60, type: !34)
!105 = !DILocation(line: 60, column: 16, scope: !102)
!106 = !DILocalVariable(name: "dataLen", scope: !102, file: !16, line: 60, type: !34)
!107 = !DILocation(line: 60, column: 19, scope: !102)
!108 = !DILocation(line: 61, column: 26, scope: !102)
!109 = !DILocation(line: 61, column: 19, scope: !102)
!110 = !DILocation(line: 61, column: 17, scope: !102)
!111 = !DILocation(line: 63, column: 16, scope: !112)
!112 = distinct !DILexicalBlock(scope: !102, file: !16, line: 63, column: 9)
!113 = !DILocation(line: 63, column: 14, scope: !112)
!114 = !DILocation(line: 63, column: 21, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !16, line: 63, column: 9)
!116 = !DILocation(line: 63, column: 25, scope: !115)
!117 = !DILocation(line: 63, column: 23, scope: !115)
!118 = !DILocation(line: 63, column: 9, scope: !112)
!119 = !DILocation(line: 65, column: 23, scope: !120)
!120 = distinct !DILexicalBlock(scope: !115, file: !16, line: 64, column: 9)
!121 = !DILocation(line: 65, column: 28, scope: !120)
!122 = !DILocation(line: 65, column: 18, scope: !120)
!123 = !DILocation(line: 65, column: 13, scope: !120)
!124 = !DILocation(line: 65, column: 21, scope: !120)
!125 = !DILocation(line: 66, column: 9, scope: !120)
!126 = !DILocation(line: 63, column: 35, scope: !115)
!127 = !DILocation(line: 63, column: 9, scope: !115)
!128 = distinct !{!128, !118, !129, !61}
!129 = !DILocation(line: 66, column: 9, scope: !112)
!130 = !DILocation(line: 67, column: 9, scope: !102)
!131 = !DILocation(line: 67, column: 20, scope: !102)
!132 = !DILocation(line: 68, column: 20, scope: !102)
!133 = !DILocation(line: 68, column: 9, scope: !102)
!134 = !DILocation(line: 69, column: 14, scope: !102)
!135 = !DILocation(line: 69, column: 9, scope: !102)
!136 = !DILocation(line: 71, column: 1, scope: !92)
