; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_51b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_51b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_51b_badSink(i64* %data) #0 !dbg !9 {
entry:
  %data.addr = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !21, metadata !DIExpression()), !dbg !26
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !26
  call void @llvm.dbg.declare(metadata i64* %i, metadata !27, metadata !DIExpression()), !dbg !32
  store i64 0, i64* %i, align 8, !dbg !33
  br label %for.cond, !dbg !35

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !36
  %cmp = icmp ult i64 %1, 100, !dbg !38
  br i1 %cmp, label %for.body, label %for.end, !dbg !39

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !40
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %2, !dbg !42
  %3 = load i64, i64* %arrayidx, align 8, !dbg !42
  %4 = load i64*, i64** %data.addr, align 8, !dbg !43
  %5 = load i64, i64* %i, align 8, !dbg !44
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !43
  store i64 %3, i64* %arrayidx1, align 8, !dbg !45
  br label %for.inc, !dbg !46

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !47
  %inc = add i64 %6, 1, !dbg !47
  store i64 %inc, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !48, !llvm.loop !49

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %data.addr, align 8, !dbg !52
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !52
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !52
  call void @printLongLongLine(i64 %8), !dbg !53
  %9 = load i64*, i64** %data.addr, align 8, !dbg !54
  %10 = bitcast i64* %9 to i8*, !dbg !54
  call void @free(i8* %10) #5, !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_51b_goodG2BSink(i64* %data) #0 !dbg !57 {
entry:
  %data.addr = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !58, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !60, metadata !DIExpression()), !dbg !62
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !62
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !62
  call void @llvm.dbg.declare(metadata i64* %i, metadata !63, metadata !DIExpression()), !dbg !65
  store i64 0, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !68

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !69
  %cmp = icmp ult i64 %1, 100, !dbg !71
  br i1 %cmp, label %for.body, label %for.end, !dbg !72

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !73
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %2, !dbg !75
  %3 = load i64, i64* %arrayidx, align 8, !dbg !75
  %4 = load i64*, i64** %data.addr, align 8, !dbg !76
  %5 = load i64, i64* %i, align 8, !dbg !77
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !76
  store i64 %3, i64* %arrayidx1, align 8, !dbg !78
  br label %for.inc, !dbg !79

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !80
  %inc = add i64 %6, 1, !dbg !80
  store i64 %inc, i64* %i, align 8, !dbg !80
  br label %for.cond, !dbg !81, !llvm.loop !82

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %data.addr, align 8, !dbg !84
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !84
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !84
  call void @printLongLongLine(i64 %8), !dbg !85
  %9 = load i64*, i64** %data.addr, align 8, !dbg !86
  %10 = bitcast i64* %9 to i8*, !dbg !86
  call void @free(i8* %10) #5, !dbg !87
  ret void, !dbg !88
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_51b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_51b_badSink", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_51b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !15, line: 27, baseType: !16)
!15 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !17, line: 44, baseType: !18)
!17 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!18 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!19 = !DILocalVariable(name: "data", arg: 1, scope: !9, file: !10, line: 23, type: !13)
!20 = !DILocation(line: 23, column: 85, scope: !9)
!21 = !DILocalVariable(name: "source", scope: !22, file: !10, line: 26, type: !23)
!22 = distinct !DILexicalBlock(scope: !9, file: !10, line: 25, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 6400, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 100)
!26 = !DILocation(line: 26, column: 17, scope: !22)
!27 = !DILocalVariable(name: "i", scope: !28, file: !10, line: 28, type: !29)
!28 = distinct !DILexicalBlock(scope: !22, file: !10, line: 27, column: 9)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !30, line: 46, baseType: !31)
!30 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!31 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!32 = !DILocation(line: 28, column: 20, scope: !28)
!33 = !DILocation(line: 30, column: 20, scope: !34)
!34 = distinct !DILexicalBlock(scope: !28, file: !10, line: 30, column: 13)
!35 = !DILocation(line: 30, column: 18, scope: !34)
!36 = !DILocation(line: 30, column: 25, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !10, line: 30, column: 13)
!38 = !DILocation(line: 30, column: 27, scope: !37)
!39 = !DILocation(line: 30, column: 13, scope: !34)
!40 = !DILocation(line: 32, column: 34, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !10, line: 31, column: 13)
!42 = !DILocation(line: 32, column: 27, scope: !41)
!43 = !DILocation(line: 32, column: 17, scope: !41)
!44 = !DILocation(line: 32, column: 22, scope: !41)
!45 = !DILocation(line: 32, column: 25, scope: !41)
!46 = !DILocation(line: 33, column: 13, scope: !41)
!47 = !DILocation(line: 30, column: 35, scope: !37)
!48 = !DILocation(line: 30, column: 13, scope: !37)
!49 = distinct !{!49, !39, !50, !51}
!50 = !DILocation(line: 33, column: 13, scope: !34)
!51 = !{!"llvm.loop.mustprogress"}
!52 = !DILocation(line: 34, column: 31, scope: !28)
!53 = !DILocation(line: 34, column: 13, scope: !28)
!54 = !DILocation(line: 35, column: 18, scope: !28)
!55 = !DILocation(line: 35, column: 13, scope: !28)
!56 = !DILocation(line: 38, column: 1, scope: !9)
!57 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_51b_goodG2BSink", scope: !10, file: !10, line: 45, type: !11, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocalVariable(name: "data", arg: 1, scope: !57, file: !10, line: 45, type: !13)
!59 = !DILocation(line: 45, column: 89, scope: !57)
!60 = !DILocalVariable(name: "source", scope: !61, file: !10, line: 48, type: !23)
!61 = distinct !DILexicalBlock(scope: !57, file: !10, line: 47, column: 5)
!62 = !DILocation(line: 48, column: 17, scope: !61)
!63 = !DILocalVariable(name: "i", scope: !64, file: !10, line: 50, type: !29)
!64 = distinct !DILexicalBlock(scope: !61, file: !10, line: 49, column: 9)
!65 = !DILocation(line: 50, column: 20, scope: !64)
!66 = !DILocation(line: 52, column: 20, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !10, line: 52, column: 13)
!68 = !DILocation(line: 52, column: 18, scope: !67)
!69 = !DILocation(line: 52, column: 25, scope: !70)
!70 = distinct !DILexicalBlock(scope: !67, file: !10, line: 52, column: 13)
!71 = !DILocation(line: 52, column: 27, scope: !70)
!72 = !DILocation(line: 52, column: 13, scope: !67)
!73 = !DILocation(line: 54, column: 34, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !10, line: 53, column: 13)
!75 = !DILocation(line: 54, column: 27, scope: !74)
!76 = !DILocation(line: 54, column: 17, scope: !74)
!77 = !DILocation(line: 54, column: 22, scope: !74)
!78 = !DILocation(line: 54, column: 25, scope: !74)
!79 = !DILocation(line: 55, column: 13, scope: !74)
!80 = !DILocation(line: 52, column: 35, scope: !70)
!81 = !DILocation(line: 52, column: 13, scope: !70)
!82 = distinct !{!82, !72, !83, !51}
!83 = !DILocation(line: 55, column: 13, scope: !67)
!84 = !DILocation(line: 56, column: 31, scope: !64)
!85 = !DILocation(line: 56, column: 13, scope: !64)
!86 = !DILocation(line: 57, column: 18, scope: !64)
!87 = !DILocation(line: 57, column: 13, scope: !64)
!88 = !DILocation(line: 60, column: 1, scope: !57)
