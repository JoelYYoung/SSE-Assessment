; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_65b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_65b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_65b_badSink(i8* %data) #0 !dbg !9 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !17, metadata !DIExpression()), !dbg !22
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !22
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !22
  call void @llvm.dbg.declare(metadata i64* %i, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !28, metadata !DIExpression()), !dbg !29
  %1 = load i8*, i8** %data.addr, align 8, !dbg !30
  %call = call i64 @strlen(i8* %1) #6, !dbg !31
  store i64 %call, i64* %dataLen, align 8, !dbg !32
  store i64 0, i64* %i, align 8, !dbg !33
  br label %for.cond, !dbg !35

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !36
  %3 = load i64, i64* %dataLen, align 8, !dbg !38
  %cmp = icmp ult i64 %2, %3, !dbg !39
  br i1 %cmp, label %for.body, label %for.end, !dbg !40

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %data.addr, align 8, !dbg !41
  %5 = load i64, i64* %i, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !41
  %6 = load i8, i8* %arrayidx, align 1, !dbg !41
  %7 = load i64, i64* %i, align 8, !dbg !44
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %7, !dbg !45
  store i8 %6, i8* %arrayidx1, align 1, !dbg !46
  br label %for.inc, !dbg !47

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !48
  %inc = add i64 %8, 1, !dbg !48
  store i64 %inc, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !49, !llvm.loop !50

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !53
  store i8 0, i8* %arrayidx2, align 1, !dbg !54
  %9 = load i8*, i8** %data.addr, align 8, !dbg !55
  call void @printLine(i8* %9), !dbg !56
  %10 = load i8*, i8** %data.addr, align 8, !dbg !57
  call void @free(i8* %10) #7, !dbg !58
  ret void, !dbg !59
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_65b_goodG2BSink(i8* %data) #0 !dbg !60 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !61, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !63, metadata !DIExpression()), !dbg !65
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !65
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !65
  call void @llvm.dbg.declare(metadata i64* %i, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !68, metadata !DIExpression()), !dbg !69
  %1 = load i8*, i8** %data.addr, align 8, !dbg !70
  %call = call i64 @strlen(i8* %1) #6, !dbg !71
  store i64 %call, i64* %dataLen, align 8, !dbg !72
  store i64 0, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !75

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !76
  %3 = load i64, i64* %dataLen, align 8, !dbg !78
  %cmp = icmp ult i64 %2, %3, !dbg !79
  br i1 %cmp, label %for.body, label %for.end, !dbg !80

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %data.addr, align 8, !dbg !81
  %5 = load i64, i64* %i, align 8, !dbg !83
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !81
  %6 = load i8, i8* %arrayidx, align 1, !dbg !81
  %7 = load i64, i64* %i, align 8, !dbg !84
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %7, !dbg !85
  store i8 %6, i8* %arrayidx1, align 1, !dbg !86
  br label %for.inc, !dbg !87

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !88
  %inc = add i64 %8, 1, !dbg !88
  store i64 %inc, i64* %i, align 8, !dbg !88
  br label %for.cond, !dbg !89, !llvm.loop !90

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !92
  store i8 0, i8* %arrayidx2, align 1, !dbg !93
  %9 = load i8*, i8** %data.addr, align 8, !dbg !94
  call void @printLine(i8* %9), !dbg !95
  %10 = load i8*, i8** %data.addr, align 8, !dbg !96
  call void @free(i8* %10) #7, !dbg !97
  ret void, !dbg !98
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_65b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_65b_badSink", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_65b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!15 = !DILocalVariable(name: "data", arg: 1, scope: !9, file: !10, line: 23, type: !13)
!16 = !DILocation(line: 23, column: 79, scope: !9)
!17 = !DILocalVariable(name: "dest", scope: !18, file: !10, line: 26, type: !19)
!18 = distinct !DILexicalBlock(scope: !9, file: !10, line: 25, column: 5)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 400, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 50)
!22 = !DILocation(line: 26, column: 14, scope: !18)
!23 = !DILocalVariable(name: "i", scope: !18, file: !10, line: 27, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !25, line: 46, baseType: !26)
!25 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!26 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!27 = !DILocation(line: 27, column: 16, scope: !18)
!28 = !DILocalVariable(name: "dataLen", scope: !18, file: !10, line: 27, type: !24)
!29 = !DILocation(line: 27, column: 19, scope: !18)
!30 = !DILocation(line: 28, column: 26, scope: !18)
!31 = !DILocation(line: 28, column: 19, scope: !18)
!32 = !DILocation(line: 28, column: 17, scope: !18)
!33 = !DILocation(line: 30, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !18, file: !10, line: 30, column: 9)
!35 = !DILocation(line: 30, column: 14, scope: !34)
!36 = !DILocation(line: 30, column: 21, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !10, line: 30, column: 9)
!38 = !DILocation(line: 30, column: 25, scope: !37)
!39 = !DILocation(line: 30, column: 23, scope: !37)
!40 = !DILocation(line: 30, column: 9, scope: !34)
!41 = !DILocation(line: 32, column: 23, scope: !42)
!42 = distinct !DILexicalBlock(scope: !37, file: !10, line: 31, column: 9)
!43 = !DILocation(line: 32, column: 28, scope: !42)
!44 = !DILocation(line: 32, column: 18, scope: !42)
!45 = !DILocation(line: 32, column: 13, scope: !42)
!46 = !DILocation(line: 32, column: 21, scope: !42)
!47 = !DILocation(line: 33, column: 9, scope: !42)
!48 = !DILocation(line: 30, column: 35, scope: !37)
!49 = !DILocation(line: 30, column: 9, scope: !37)
!50 = distinct !{!50, !40, !51, !52}
!51 = !DILocation(line: 33, column: 9, scope: !34)
!52 = !{!"llvm.loop.mustprogress"}
!53 = !DILocation(line: 34, column: 9, scope: !18)
!54 = !DILocation(line: 34, column: 20, scope: !18)
!55 = !DILocation(line: 35, column: 19, scope: !18)
!56 = !DILocation(line: 35, column: 9, scope: !18)
!57 = !DILocation(line: 36, column: 14, scope: !18)
!58 = !DILocation(line: 36, column: 9, scope: !18)
!59 = !DILocation(line: 38, column: 1, scope: !9)
!60 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_65b_goodG2BSink", scope: !10, file: !10, line: 45, type: !11, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocalVariable(name: "data", arg: 1, scope: !60, file: !10, line: 45, type: !13)
!62 = !DILocation(line: 45, column: 83, scope: !60)
!63 = !DILocalVariable(name: "dest", scope: !64, file: !10, line: 48, type: !19)
!64 = distinct !DILexicalBlock(scope: !60, file: !10, line: 47, column: 5)
!65 = !DILocation(line: 48, column: 14, scope: !64)
!66 = !DILocalVariable(name: "i", scope: !64, file: !10, line: 49, type: !24)
!67 = !DILocation(line: 49, column: 16, scope: !64)
!68 = !DILocalVariable(name: "dataLen", scope: !64, file: !10, line: 49, type: !24)
!69 = !DILocation(line: 49, column: 19, scope: !64)
!70 = !DILocation(line: 50, column: 26, scope: !64)
!71 = !DILocation(line: 50, column: 19, scope: !64)
!72 = !DILocation(line: 50, column: 17, scope: !64)
!73 = !DILocation(line: 52, column: 16, scope: !74)
!74 = distinct !DILexicalBlock(scope: !64, file: !10, line: 52, column: 9)
!75 = !DILocation(line: 52, column: 14, scope: !74)
!76 = !DILocation(line: 52, column: 21, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !10, line: 52, column: 9)
!78 = !DILocation(line: 52, column: 25, scope: !77)
!79 = !DILocation(line: 52, column: 23, scope: !77)
!80 = !DILocation(line: 52, column: 9, scope: !74)
!81 = !DILocation(line: 54, column: 23, scope: !82)
!82 = distinct !DILexicalBlock(scope: !77, file: !10, line: 53, column: 9)
!83 = !DILocation(line: 54, column: 28, scope: !82)
!84 = !DILocation(line: 54, column: 18, scope: !82)
!85 = !DILocation(line: 54, column: 13, scope: !82)
!86 = !DILocation(line: 54, column: 21, scope: !82)
!87 = !DILocation(line: 55, column: 9, scope: !82)
!88 = !DILocation(line: 52, column: 35, scope: !77)
!89 = !DILocation(line: 52, column: 9, scope: !77)
!90 = distinct !{!90, !80, !91, !52}
!91 = !DILocation(line: 55, column: 9, scope: !74)
!92 = !DILocation(line: 56, column: 9, scope: !64)
!93 = !DILocation(line: 56, column: 20, scope: !64)
!94 = !DILocation(line: 57, column: 19, scope: !64)
!95 = !DILocation(line: 57, column: 9, scope: !64)
!96 = !DILocation(line: 58, column: 14, scope: !64)
!97 = !DILocation(line: 58, column: 9, scope: !64)
!98 = !DILocation(line: 60, column: 1, scope: !60)
