; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_67b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_67b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_67_structType = type { i8* }

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_67b_badSink(i8* %myStruct.coerce) #0 !dbg !9 {
entry:
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_67_structType, align 8
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_67_structType* %myStruct, i32 0, i32 0
  store i8* %myStruct.coerce, i8** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_67_structType* %myStruct, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !22
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_67_structType* %myStruct, i32 0, i32 0, !dbg !23
  %0 = load i8*, i8** %structFirst, align 8, !dbg !23
  store i8* %0, i8** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !24, metadata !DIExpression()), !dbg !29
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !29
  call void @llvm.dbg.declare(metadata i64* %i, metadata !30, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !35, metadata !DIExpression()), !dbg !36
  %2 = load i8*, i8** %data, align 8, !dbg !37
  %call = call i64 @strlen(i8* %2) #6, !dbg !38
  store i64 %call, i64* %dataLen, align 8, !dbg !39
  store i64 0, i64* %i, align 8, !dbg !40
  br label %for.cond, !dbg !42

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !43
  %4 = load i64, i64* %dataLen, align 8, !dbg !45
  %cmp = icmp ult i64 %3, %4, !dbg !46
  br i1 %cmp, label %for.body, label %for.end, !dbg !47

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !48
  %6 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !48
  %7 = load i8, i8* %arrayidx, align 1, !dbg !48
  %8 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %8, !dbg !52
  store i8 %7, i8* %arrayidx1, align 1, !dbg !53
  br label %for.inc, !dbg !54

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !55
  %inc = add i64 %9, 1, !dbg !55
  store i64 %inc, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !56, !llvm.loop !57

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !60
  store i8 0, i8* %arrayidx2, align 1, !dbg !61
  %10 = load i8*, i8** %data, align 8, !dbg !62
  call void @printLine(i8* %10), !dbg !63
  %11 = load i8*, i8** %data, align 8, !dbg !64
  call void @free(i8* %11) #7, !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_67b_goodG2BSink(i8* %myStruct.coerce) #0 !dbg !67 {
entry:
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_67_structType, align 8
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_67_structType* %myStruct, i32 0, i32 0
  store i8* %myStruct.coerce, i8** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_67_structType* %myStruct, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata i8** %data, metadata !70, metadata !DIExpression()), !dbg !71
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_67_structType* %myStruct, i32 0, i32 0, !dbg !72
  %0 = load i8*, i8** %structFirst, align 8, !dbg !72
  store i8* %0, i8** %data, align 8, !dbg !71
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !73, metadata !DIExpression()), !dbg !75
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !75
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !75
  call void @llvm.dbg.declare(metadata i64* %i, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !78, metadata !DIExpression()), !dbg !79
  %2 = load i8*, i8** %data, align 8, !dbg !80
  %call = call i64 @strlen(i8* %2) #6, !dbg !81
  store i64 %call, i64* %dataLen, align 8, !dbg !82
  store i64 0, i64* %i, align 8, !dbg !83
  br label %for.cond, !dbg !85

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !86
  %4 = load i64, i64* %dataLen, align 8, !dbg !88
  %cmp = icmp ult i64 %3, %4, !dbg !89
  br i1 %cmp, label %for.body, label %for.end, !dbg !90

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !91
  %6 = load i64, i64* %i, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !91
  %7 = load i8, i8* %arrayidx, align 1, !dbg !91
  %8 = load i64, i64* %i, align 8, !dbg !94
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %8, !dbg !95
  store i8 %7, i8* %arrayidx1, align 1, !dbg !96
  br label %for.inc, !dbg !97

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !98
  %inc = add i64 %9, 1, !dbg !98
  store i64 %inc, i64* %i, align 8, !dbg !98
  br label %for.cond, !dbg !99, !llvm.loop !100

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !102
  store i8 0, i8* %arrayidx2, align 1, !dbg !103
  %10 = load i8*, i8** %data, align 8, !dbg !104
  call void @printLine(i8* %10), !dbg !105
  %11 = load i8*, i8** %data, align 8, !dbg !106
  call void @free(i8* %11) #7, !dbg !107
  ret void, !dbg !108
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_67b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_67b_badSink", scope: !10, file: !10, line: 28, type: !11, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_67b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_67_structType", file: !10, line: 24, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_67_structType", file: !10, line: 21, size: 64, elements: !15)
!15 = !{!16}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !14, file: !10, line: 23, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocalVariable(name: "myStruct", arg: 1, scope: !9, file: !10, line: 28, type: !13)
!20 = !DILocation(line: 28, column: 140, scope: !9)
!21 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 30, type: !17)
!22 = !DILocation(line: 30, column: 12, scope: !9)
!23 = !DILocation(line: 30, column: 28, scope: !9)
!24 = !DILocalVariable(name: "dest", scope: !25, file: !10, line: 32, type: !26)
!25 = distinct !DILexicalBlock(scope: !9, file: !10, line: 31, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 400, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 50)
!29 = !DILocation(line: 32, column: 14, scope: !25)
!30 = !DILocalVariable(name: "i", scope: !25, file: !10, line: 33, type: !31)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !32, line: 46, baseType: !33)
!32 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!33 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!34 = !DILocation(line: 33, column: 16, scope: !25)
!35 = !DILocalVariable(name: "dataLen", scope: !25, file: !10, line: 33, type: !31)
!36 = !DILocation(line: 33, column: 19, scope: !25)
!37 = !DILocation(line: 34, column: 26, scope: !25)
!38 = !DILocation(line: 34, column: 19, scope: !25)
!39 = !DILocation(line: 34, column: 17, scope: !25)
!40 = !DILocation(line: 36, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !25, file: !10, line: 36, column: 9)
!42 = !DILocation(line: 36, column: 14, scope: !41)
!43 = !DILocation(line: 36, column: 21, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !10, line: 36, column: 9)
!45 = !DILocation(line: 36, column: 25, scope: !44)
!46 = !DILocation(line: 36, column: 23, scope: !44)
!47 = !DILocation(line: 36, column: 9, scope: !41)
!48 = !DILocation(line: 38, column: 23, scope: !49)
!49 = distinct !DILexicalBlock(scope: !44, file: !10, line: 37, column: 9)
!50 = !DILocation(line: 38, column: 28, scope: !49)
!51 = !DILocation(line: 38, column: 18, scope: !49)
!52 = !DILocation(line: 38, column: 13, scope: !49)
!53 = !DILocation(line: 38, column: 21, scope: !49)
!54 = !DILocation(line: 39, column: 9, scope: !49)
!55 = !DILocation(line: 36, column: 35, scope: !44)
!56 = !DILocation(line: 36, column: 9, scope: !44)
!57 = distinct !{!57, !47, !58, !59}
!58 = !DILocation(line: 39, column: 9, scope: !41)
!59 = !{!"llvm.loop.mustprogress"}
!60 = !DILocation(line: 40, column: 9, scope: !25)
!61 = !DILocation(line: 40, column: 20, scope: !25)
!62 = !DILocation(line: 41, column: 19, scope: !25)
!63 = !DILocation(line: 41, column: 9, scope: !25)
!64 = !DILocation(line: 42, column: 14, scope: !25)
!65 = !DILocation(line: 42, column: 9, scope: !25)
!66 = !DILocation(line: 44, column: 1, scope: !9)
!67 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_67b_goodG2BSink", scope: !10, file: !10, line: 51, type: !11, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocalVariable(name: "myStruct", arg: 1, scope: !67, file: !10, line: 51, type: !13)
!69 = !DILocation(line: 51, column: 144, scope: !67)
!70 = !DILocalVariable(name: "data", scope: !67, file: !10, line: 53, type: !17)
!71 = !DILocation(line: 53, column: 12, scope: !67)
!72 = !DILocation(line: 53, column: 28, scope: !67)
!73 = !DILocalVariable(name: "dest", scope: !74, file: !10, line: 55, type: !26)
!74 = distinct !DILexicalBlock(scope: !67, file: !10, line: 54, column: 5)
!75 = !DILocation(line: 55, column: 14, scope: !74)
!76 = !DILocalVariable(name: "i", scope: !74, file: !10, line: 56, type: !31)
!77 = !DILocation(line: 56, column: 16, scope: !74)
!78 = !DILocalVariable(name: "dataLen", scope: !74, file: !10, line: 56, type: !31)
!79 = !DILocation(line: 56, column: 19, scope: !74)
!80 = !DILocation(line: 57, column: 26, scope: !74)
!81 = !DILocation(line: 57, column: 19, scope: !74)
!82 = !DILocation(line: 57, column: 17, scope: !74)
!83 = !DILocation(line: 59, column: 16, scope: !84)
!84 = distinct !DILexicalBlock(scope: !74, file: !10, line: 59, column: 9)
!85 = !DILocation(line: 59, column: 14, scope: !84)
!86 = !DILocation(line: 59, column: 21, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !10, line: 59, column: 9)
!88 = !DILocation(line: 59, column: 25, scope: !87)
!89 = !DILocation(line: 59, column: 23, scope: !87)
!90 = !DILocation(line: 59, column: 9, scope: !84)
!91 = !DILocation(line: 61, column: 23, scope: !92)
!92 = distinct !DILexicalBlock(scope: !87, file: !10, line: 60, column: 9)
!93 = !DILocation(line: 61, column: 28, scope: !92)
!94 = !DILocation(line: 61, column: 18, scope: !92)
!95 = !DILocation(line: 61, column: 13, scope: !92)
!96 = !DILocation(line: 61, column: 21, scope: !92)
!97 = !DILocation(line: 62, column: 9, scope: !92)
!98 = !DILocation(line: 59, column: 35, scope: !87)
!99 = !DILocation(line: 59, column: 9, scope: !87)
!100 = distinct !{!100, !90, !101, !59}
!101 = !DILocation(line: 62, column: 9, scope: !84)
!102 = !DILocation(line: 63, column: 9, scope: !74)
!103 = !DILocation(line: 63, column: 20, scope: !74)
!104 = !DILocation(line: 64, column: 19, scope: !74)
!105 = !DILocation(line: 64, column: 9, scope: !74)
!106 = !DILocation(line: 65, column: 14, scope: !74)
!107 = !DILocation(line: 65, column: 9, scope: !74)
!108 = !DILocation(line: 67, column: 1, scope: !67)
