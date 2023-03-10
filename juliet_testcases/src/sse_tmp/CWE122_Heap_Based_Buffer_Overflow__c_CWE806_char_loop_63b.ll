; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_63b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_63b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_63b_badSink(i8** %dataPtr) #0 !dbg !9 {
entry:
  %dataPtr.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i8** %dataPtr, i8*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataPtr.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i8**, i8*** %dataPtr.addr, align 8, !dbg !20
  %1 = load i8*, i8** %0, align 8, !dbg !21
  store i8* %1, i8** %data, align 8, !dbg !19
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !22, metadata !DIExpression()), !dbg !27
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !27
  call void @llvm.dbg.declare(metadata i64* %i, metadata !28, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !33, metadata !DIExpression()), !dbg !34
  %3 = load i8*, i8** %data, align 8, !dbg !35
  %call = call i64 @strlen(i8* %3) #6, !dbg !36
  store i64 %call, i64* %dataLen, align 8, !dbg !37
  store i64 0, i64* %i, align 8, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !41
  %5 = load i64, i64* %dataLen, align 8, !dbg !43
  %cmp = icmp ult i64 %4, %5, !dbg !44
  br i1 %cmp, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !46
  %7 = load i64, i64* %i, align 8, !dbg !48
  %arrayidx = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !46
  %8 = load i8, i8* %arrayidx, align 1, !dbg !46
  %9 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %9, !dbg !50
  store i8 %8, i8* %arrayidx1, align 1, !dbg !51
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !53
  %inc = add i64 %10, 1, !dbg !53
  store i64 %inc, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !58
  store i8 0, i8* %arrayidx2, align 1, !dbg !59
  %11 = load i8*, i8** %data, align 8, !dbg !60
  call void @printLine(i8* %11), !dbg !61
  %12 = load i8*, i8** %data, align 8, !dbg !62
  call void @free(i8* %12) #7, !dbg !63
  ret void, !dbg !64
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_63b_goodG2BSink(i8** %dataPtr) #0 !dbg !65 {
entry:
  %dataPtr.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i8** %dataPtr, i8*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataPtr.addr, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata i8** %data, metadata !68, metadata !DIExpression()), !dbg !69
  %0 = load i8**, i8*** %dataPtr.addr, align 8, !dbg !70
  %1 = load i8*, i8** %0, align 8, !dbg !71
  store i8* %1, i8** %data, align 8, !dbg !69
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !72, metadata !DIExpression()), !dbg !74
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !74
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !74
  call void @llvm.dbg.declare(metadata i64* %i, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !77, metadata !DIExpression()), !dbg !78
  %3 = load i8*, i8** %data, align 8, !dbg !79
  %call = call i64 @strlen(i8* %3) #6, !dbg !80
  store i64 %call, i64* %dataLen, align 8, !dbg !81
  store i64 0, i64* %i, align 8, !dbg !82
  br label %for.cond, !dbg !84

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !85
  %5 = load i64, i64* %dataLen, align 8, !dbg !87
  %cmp = icmp ult i64 %4, %5, !dbg !88
  br i1 %cmp, label %for.body, label %for.end, !dbg !89

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !90
  %7 = load i64, i64* %i, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !90
  %8 = load i8, i8* %arrayidx, align 1, !dbg !90
  %9 = load i64, i64* %i, align 8, !dbg !93
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %9, !dbg !94
  store i8 %8, i8* %arrayidx1, align 1, !dbg !95
  br label %for.inc, !dbg !96

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !97
  %inc = add i64 %10, 1, !dbg !97
  store i64 %inc, i64* %i, align 8, !dbg !97
  br label %for.cond, !dbg !98, !llvm.loop !99

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !101
  store i8 0, i8* %arrayidx2, align 1, !dbg !102
  %11 = load i8*, i8** %data, align 8, !dbg !103
  call void @printLine(i8* %11), !dbg !104
  %12 = load i8*, i8** %data, align 8, !dbg !105
  call void @free(i8* %12) #7, !dbg !106
  ret void, !dbg !107
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_63b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_63b_badSink", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_63b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !9, file: !10, line: 23, type: !13)
!17 = !DILocation(line: 23, column: 81, scope: !9)
!18 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 25, type: !14)
!19 = !DILocation(line: 25, column: 12, scope: !9)
!20 = !DILocation(line: 25, column: 20, scope: !9)
!21 = !DILocation(line: 25, column: 19, scope: !9)
!22 = !DILocalVariable(name: "dest", scope: !23, file: !10, line: 27, type: !24)
!23 = distinct !DILexicalBlock(scope: !9, file: !10, line: 26, column: 5)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 400, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 50)
!27 = !DILocation(line: 27, column: 14, scope: !23)
!28 = !DILocalVariable(name: "i", scope: !23, file: !10, line: 28, type: !29)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !30, line: 46, baseType: !31)
!30 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!31 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!32 = !DILocation(line: 28, column: 16, scope: !23)
!33 = !DILocalVariable(name: "dataLen", scope: !23, file: !10, line: 28, type: !29)
!34 = !DILocation(line: 28, column: 19, scope: !23)
!35 = !DILocation(line: 29, column: 26, scope: !23)
!36 = !DILocation(line: 29, column: 19, scope: !23)
!37 = !DILocation(line: 29, column: 17, scope: !23)
!38 = !DILocation(line: 31, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !23, file: !10, line: 31, column: 9)
!40 = !DILocation(line: 31, column: 14, scope: !39)
!41 = !DILocation(line: 31, column: 21, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !10, line: 31, column: 9)
!43 = !DILocation(line: 31, column: 25, scope: !42)
!44 = !DILocation(line: 31, column: 23, scope: !42)
!45 = !DILocation(line: 31, column: 9, scope: !39)
!46 = !DILocation(line: 33, column: 23, scope: !47)
!47 = distinct !DILexicalBlock(scope: !42, file: !10, line: 32, column: 9)
!48 = !DILocation(line: 33, column: 28, scope: !47)
!49 = !DILocation(line: 33, column: 18, scope: !47)
!50 = !DILocation(line: 33, column: 13, scope: !47)
!51 = !DILocation(line: 33, column: 21, scope: !47)
!52 = !DILocation(line: 34, column: 9, scope: !47)
!53 = !DILocation(line: 31, column: 35, scope: !42)
!54 = !DILocation(line: 31, column: 9, scope: !42)
!55 = distinct !{!55, !45, !56, !57}
!56 = !DILocation(line: 34, column: 9, scope: !39)
!57 = !{!"llvm.loop.mustprogress"}
!58 = !DILocation(line: 35, column: 9, scope: !23)
!59 = !DILocation(line: 35, column: 20, scope: !23)
!60 = !DILocation(line: 36, column: 19, scope: !23)
!61 = !DILocation(line: 36, column: 9, scope: !23)
!62 = !DILocation(line: 37, column: 14, scope: !23)
!63 = !DILocation(line: 37, column: 9, scope: !23)
!64 = !DILocation(line: 39, column: 1, scope: !9)
!65 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_63b_goodG2BSink", scope: !10, file: !10, line: 46, type: !11, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !65, file: !10, line: 46, type: !13)
!67 = !DILocation(line: 46, column: 85, scope: !65)
!68 = !DILocalVariable(name: "data", scope: !65, file: !10, line: 48, type: !14)
!69 = !DILocation(line: 48, column: 12, scope: !65)
!70 = !DILocation(line: 48, column: 20, scope: !65)
!71 = !DILocation(line: 48, column: 19, scope: !65)
!72 = !DILocalVariable(name: "dest", scope: !73, file: !10, line: 50, type: !24)
!73 = distinct !DILexicalBlock(scope: !65, file: !10, line: 49, column: 5)
!74 = !DILocation(line: 50, column: 14, scope: !73)
!75 = !DILocalVariable(name: "i", scope: !73, file: !10, line: 51, type: !29)
!76 = !DILocation(line: 51, column: 16, scope: !73)
!77 = !DILocalVariable(name: "dataLen", scope: !73, file: !10, line: 51, type: !29)
!78 = !DILocation(line: 51, column: 19, scope: !73)
!79 = !DILocation(line: 52, column: 26, scope: !73)
!80 = !DILocation(line: 52, column: 19, scope: !73)
!81 = !DILocation(line: 52, column: 17, scope: !73)
!82 = !DILocation(line: 54, column: 16, scope: !83)
!83 = distinct !DILexicalBlock(scope: !73, file: !10, line: 54, column: 9)
!84 = !DILocation(line: 54, column: 14, scope: !83)
!85 = !DILocation(line: 54, column: 21, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !10, line: 54, column: 9)
!87 = !DILocation(line: 54, column: 25, scope: !86)
!88 = !DILocation(line: 54, column: 23, scope: !86)
!89 = !DILocation(line: 54, column: 9, scope: !83)
!90 = !DILocation(line: 56, column: 23, scope: !91)
!91 = distinct !DILexicalBlock(scope: !86, file: !10, line: 55, column: 9)
!92 = !DILocation(line: 56, column: 28, scope: !91)
!93 = !DILocation(line: 56, column: 18, scope: !91)
!94 = !DILocation(line: 56, column: 13, scope: !91)
!95 = !DILocation(line: 56, column: 21, scope: !91)
!96 = !DILocation(line: 57, column: 9, scope: !91)
!97 = !DILocation(line: 54, column: 35, scope: !86)
!98 = !DILocation(line: 54, column: 9, scope: !86)
!99 = distinct !{!99, !89, !100, !57}
!100 = !DILocation(line: 57, column: 9, scope: !83)
!101 = !DILocation(line: 58, column: 9, scope: !73)
!102 = !DILocation(line: 58, column: 20, scope: !73)
!103 = !DILocation(line: 59, column: 19, scope: !73)
!104 = !DILocation(line: 59, column: 9, scope: !73)
!105 = !DILocation(line: 60, column: 14, scope: !73)
!106 = !DILocation(line: 60, column: 9, scope: !73)
!107 = !DILocation(line: 62, column: 1, scope: !65)
