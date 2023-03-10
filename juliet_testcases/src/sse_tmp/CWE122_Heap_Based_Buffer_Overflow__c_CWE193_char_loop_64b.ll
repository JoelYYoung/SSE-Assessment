; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_64b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_64b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_64b_badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_64b_goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_64b_badSink(i8* %dataVoidPtr) #0 !dbg !13 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8*** %dataPtr, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !22
  %1 = bitcast i8* %0 to i8**, !dbg !23
  store i8** %1, i8*** %dataPtr, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  %2 = load i8**, i8*** %dataPtr, align 8, !dbg !26
  %3 = load i8*, i8** %2, align 8, !dbg !27
  store i8* %3, i8** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !28, metadata !DIExpression()), !dbg !33
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !33
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_64b_badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !33
  call void @llvm.dbg.declare(metadata i64* %i, metadata !34, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !39, metadata !DIExpression()), !dbg !40
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !41
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !42
  store i64 %call, i64* %sourceLen, align 8, !dbg !43
  store i64 0, i64* %i, align 8, !dbg !44
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !47
  %6 = load i64, i64* %sourceLen, align 8, !dbg !49
  %add = add i64 %6, 1, !dbg !50
  %cmp = icmp ult i64 %5, %add, !dbg !51
  br i1 %cmp, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %7, !dbg !55
  %8 = load i8, i8* %arrayidx, align 1, !dbg !55
  %9 = load i8*, i8** %data, align 8, !dbg !56
  %10 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx1 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !56
  store i8 %8, i8* %arrayidx1, align 1, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !60
  %inc = add i64 %11, 1, !dbg !60
  store i64 %inc, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %data, align 8, !dbg !65
  call void @printLine(i8* %12), !dbg !66
  %13 = load i8*, i8** %data, align 8, !dbg !67
  call void @free(i8* %13) #7, !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_64b_goodG2BSink(i8* %dataVoidPtr) #0 !dbg !70 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata i8*** %dataPtr, metadata !73, metadata !DIExpression()), !dbg !74
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !75
  %1 = bitcast i8* %0 to i8**, !dbg !76
  store i8** %1, i8*** %dataPtr, align 8, !dbg !74
  call void @llvm.dbg.declare(metadata i8** %data, metadata !77, metadata !DIExpression()), !dbg !78
  %2 = load i8**, i8*** %dataPtr, align 8, !dbg !79
  %3 = load i8*, i8** %2, align 8, !dbg !80
  store i8* %3, i8** %data, align 8, !dbg !78
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !81, metadata !DIExpression()), !dbg !83
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !83
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_64b_goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !83
  call void @llvm.dbg.declare(metadata i64* %i, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !86, metadata !DIExpression()), !dbg !87
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !88
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !89
  store i64 %call, i64* %sourceLen, align 8, !dbg !90
  store i64 0, i64* %i, align 8, !dbg !91
  br label %for.cond, !dbg !93

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !94
  %6 = load i64, i64* %sourceLen, align 8, !dbg !96
  %add = add i64 %6, 1, !dbg !97
  %cmp = icmp ult i64 %5, %add, !dbg !98
  br i1 %cmp, label %for.body, label %for.end, !dbg !99

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !100
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %7, !dbg !102
  %8 = load i8, i8* %arrayidx, align 1, !dbg !102
  %9 = load i8*, i8** %data, align 8, !dbg !103
  %10 = load i64, i64* %i, align 8, !dbg !104
  %arrayidx1 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !103
  store i8 %8, i8* %arrayidx1, align 1, !dbg !105
  br label %for.inc, !dbg !106

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !107
  %inc = add i64 %11, 1, !dbg !107
  store i64 %inc, i64* %i, align 8, !dbg !107
  br label %for.cond, !dbg !108, !llvm.loop !109

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %data, align 8, !dbg !111
  call void @printLine(i8* %12), !dbg !112
  %13 = load i8*, i8** %data, align 8, !dbg !113
  call void @free(i8* %13) #7, !dbg !114
  ret void, !dbg !115
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_64b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_64b_badSink", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_64b.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !17}
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!18 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !13, file: !14, line: 28, type: !17)
!19 = !DILocation(line: 28, column: 79, scope: !13)
!20 = !DILocalVariable(name: "dataPtr", scope: !13, file: !14, line: 31, type: !4)
!21 = !DILocation(line: 31, column: 14, scope: !13)
!22 = !DILocation(line: 31, column: 34, scope: !13)
!23 = !DILocation(line: 31, column: 24, scope: !13)
!24 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 33, type: !5)
!25 = !DILocation(line: 33, column: 12, scope: !13)
!26 = !DILocation(line: 33, column: 21, scope: !13)
!27 = !DILocation(line: 33, column: 20, scope: !13)
!28 = !DILocalVariable(name: "source", scope: !29, file: !14, line: 35, type: !30)
!29 = distinct !DILexicalBlock(scope: !13, file: !14, line: 34, column: 5)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 88, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 11)
!33 = !DILocation(line: 35, column: 14, scope: !29)
!34 = !DILocalVariable(name: "i", scope: !29, file: !14, line: 36, type: !35)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !36, line: 46, baseType: !37)
!36 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!37 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!38 = !DILocation(line: 36, column: 16, scope: !29)
!39 = !DILocalVariable(name: "sourceLen", scope: !29, file: !14, line: 36, type: !35)
!40 = !DILocation(line: 36, column: 19, scope: !29)
!41 = !DILocation(line: 37, column: 28, scope: !29)
!42 = !DILocation(line: 37, column: 21, scope: !29)
!43 = !DILocation(line: 37, column: 19, scope: !29)
!44 = !DILocation(line: 40, column: 16, scope: !45)
!45 = distinct !DILexicalBlock(scope: !29, file: !14, line: 40, column: 9)
!46 = !DILocation(line: 40, column: 14, scope: !45)
!47 = !DILocation(line: 40, column: 21, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !14, line: 40, column: 9)
!49 = !DILocation(line: 40, column: 25, scope: !48)
!50 = !DILocation(line: 40, column: 35, scope: !48)
!51 = !DILocation(line: 40, column: 23, scope: !48)
!52 = !DILocation(line: 40, column: 9, scope: !45)
!53 = !DILocation(line: 42, column: 30, scope: !54)
!54 = distinct !DILexicalBlock(scope: !48, file: !14, line: 41, column: 9)
!55 = !DILocation(line: 42, column: 23, scope: !54)
!56 = !DILocation(line: 42, column: 13, scope: !54)
!57 = !DILocation(line: 42, column: 18, scope: !54)
!58 = !DILocation(line: 42, column: 21, scope: !54)
!59 = !DILocation(line: 43, column: 9, scope: !54)
!60 = !DILocation(line: 40, column: 41, scope: !48)
!61 = !DILocation(line: 40, column: 9, scope: !48)
!62 = distinct !{!62, !52, !63, !64}
!63 = !DILocation(line: 43, column: 9, scope: !45)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 44, column: 19, scope: !29)
!66 = !DILocation(line: 44, column: 9, scope: !29)
!67 = !DILocation(line: 45, column: 14, scope: !29)
!68 = !DILocation(line: 45, column: 9, scope: !29)
!69 = !DILocation(line: 47, column: 1, scope: !13)
!70 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_64b_goodG2BSink", scope: !14, file: !14, line: 54, type: !15, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !70, file: !14, line: 54, type: !17)
!72 = !DILocation(line: 54, column: 83, scope: !70)
!73 = !DILocalVariable(name: "dataPtr", scope: !70, file: !14, line: 57, type: !4)
!74 = !DILocation(line: 57, column: 14, scope: !70)
!75 = !DILocation(line: 57, column: 34, scope: !70)
!76 = !DILocation(line: 57, column: 24, scope: !70)
!77 = !DILocalVariable(name: "data", scope: !70, file: !14, line: 59, type: !5)
!78 = !DILocation(line: 59, column: 12, scope: !70)
!79 = !DILocation(line: 59, column: 21, scope: !70)
!80 = !DILocation(line: 59, column: 20, scope: !70)
!81 = !DILocalVariable(name: "source", scope: !82, file: !14, line: 61, type: !30)
!82 = distinct !DILexicalBlock(scope: !70, file: !14, line: 60, column: 5)
!83 = !DILocation(line: 61, column: 14, scope: !82)
!84 = !DILocalVariable(name: "i", scope: !82, file: !14, line: 62, type: !35)
!85 = !DILocation(line: 62, column: 16, scope: !82)
!86 = !DILocalVariable(name: "sourceLen", scope: !82, file: !14, line: 62, type: !35)
!87 = !DILocation(line: 62, column: 19, scope: !82)
!88 = !DILocation(line: 63, column: 28, scope: !82)
!89 = !DILocation(line: 63, column: 21, scope: !82)
!90 = !DILocation(line: 63, column: 19, scope: !82)
!91 = !DILocation(line: 66, column: 16, scope: !92)
!92 = distinct !DILexicalBlock(scope: !82, file: !14, line: 66, column: 9)
!93 = !DILocation(line: 66, column: 14, scope: !92)
!94 = !DILocation(line: 66, column: 21, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !14, line: 66, column: 9)
!96 = !DILocation(line: 66, column: 25, scope: !95)
!97 = !DILocation(line: 66, column: 35, scope: !95)
!98 = !DILocation(line: 66, column: 23, scope: !95)
!99 = !DILocation(line: 66, column: 9, scope: !92)
!100 = !DILocation(line: 68, column: 30, scope: !101)
!101 = distinct !DILexicalBlock(scope: !95, file: !14, line: 67, column: 9)
!102 = !DILocation(line: 68, column: 23, scope: !101)
!103 = !DILocation(line: 68, column: 13, scope: !101)
!104 = !DILocation(line: 68, column: 18, scope: !101)
!105 = !DILocation(line: 68, column: 21, scope: !101)
!106 = !DILocation(line: 69, column: 9, scope: !101)
!107 = !DILocation(line: 66, column: 41, scope: !95)
!108 = !DILocation(line: 66, column: 9, scope: !95)
!109 = distinct !{!109, !99, !110, !64}
!110 = !DILocation(line: 69, column: 9, scope: !92)
!111 = !DILocation(line: 70, column: 19, scope: !82)
!112 = !DILocation(line: 70, column: 9, scope: !82)
!113 = !DILocation(line: 71, column: 14, scope: !82)
!114 = !DILocation(line: 71, column: 9, scope: !82)
!115 = !DILocation(line: 73, column: 1, scope: !70)
