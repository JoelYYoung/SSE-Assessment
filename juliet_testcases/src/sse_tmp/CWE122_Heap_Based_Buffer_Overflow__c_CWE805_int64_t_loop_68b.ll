; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_68b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_68b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_68_badData = external dso_local global i64*, align 8
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_68_goodG2BData = external dso_local global i64*, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_68b_badSink() #0 !dbg !9 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !13, metadata !DIExpression()), !dbg !20
  %0 = load i64*, i64** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_68_badData, align 8, !dbg !21
  store i64* %0, i64** %data, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !22, metadata !DIExpression()), !dbg !27
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !27
  call void @llvm.dbg.declare(metadata i64* %i, metadata !28, metadata !DIExpression()), !dbg !33
  store i64 0, i64* %i, align 8, !dbg !34
  br label %for.cond, !dbg !36

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !37
  %cmp = icmp ult i64 %2, 100, !dbg !39
  br i1 %cmp, label %for.body, label %for.end, !dbg !40

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !41
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %3, !dbg !43
  %4 = load i64, i64* %arrayidx, align 8, !dbg !43
  %5 = load i64*, i64** %data, align 8, !dbg !44
  %6 = load i64, i64* %i, align 8, !dbg !45
  %arrayidx1 = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !44
  store i64 %4, i64* %arrayidx1, align 8, !dbg !46
  br label %for.inc, !dbg !47

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !48
  %inc = add i64 %7, 1, !dbg !48
  store i64 %inc, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !49, !llvm.loop !50

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %data, align 8, !dbg !53
  %arrayidx2 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !53
  %9 = load i64, i64* %arrayidx2, align 8, !dbg !53
  call void @printLongLongLine(i64 %9), !dbg !54
  %10 = load i64*, i64** %data, align 8, !dbg !55
  %11 = bitcast i64* %10 to i8*, !dbg !55
  call void @free(i8* %11) #5, !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_68b_goodG2BSink() #0 !dbg !58 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !59, metadata !DIExpression()), !dbg !60
  %0 = load i64*, i64** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_68_goodG2BData, align 8, !dbg !61
  store i64* %0, i64** %data, align 8, !dbg !60
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !62, metadata !DIExpression()), !dbg !64
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !64
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !64
  call void @llvm.dbg.declare(metadata i64* %i, metadata !65, metadata !DIExpression()), !dbg !67
  store i64 0, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !70

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !71
  %cmp = icmp ult i64 %2, 100, !dbg !73
  br i1 %cmp, label %for.body, label %for.end, !dbg !74

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !75
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %3, !dbg !77
  %4 = load i64, i64* %arrayidx, align 8, !dbg !77
  %5 = load i64*, i64** %data, align 8, !dbg !78
  %6 = load i64, i64* %i, align 8, !dbg !79
  %arrayidx1 = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !78
  store i64 %4, i64* %arrayidx1, align 8, !dbg !80
  br label %for.inc, !dbg !81

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !82
  %inc = add i64 %7, 1, !dbg !82
  store i64 %inc, i64* %i, align 8, !dbg !82
  br label %for.cond, !dbg !83, !llvm.loop !84

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %data, align 8, !dbg !86
  %arrayidx2 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !86
  %9 = load i64, i64* %arrayidx2, align 8, !dbg !86
  call void @printLongLongLine(i64 %9), !dbg !87
  %10 = load i64*, i64** %data, align 8, !dbg !88
  %11 = bitcast i64* %10 to i8*, !dbg !88
  call void @free(i8* %11) #5, !dbg !89
  ret void, !dbg !90
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_68b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_68b_badSink", scope: !10, file: !10, line: 26, type: !11, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_68b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 28, type: !14)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !16, line: 27, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !18, line: 44, baseType: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!19 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!20 = !DILocation(line: 28, column: 15, scope: !9)
!21 = !DILocation(line: 28, column: 22, scope: !9)
!22 = !DILocalVariable(name: "source", scope: !23, file: !10, line: 30, type: !24)
!23 = distinct !DILexicalBlock(scope: !9, file: !10, line: 29, column: 5)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 6400, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 100)
!27 = !DILocation(line: 30, column: 17, scope: !23)
!28 = !DILocalVariable(name: "i", scope: !29, file: !10, line: 32, type: !30)
!29 = distinct !DILexicalBlock(scope: !23, file: !10, line: 31, column: 9)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !31, line: 46, baseType: !32)
!31 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!32 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!33 = !DILocation(line: 32, column: 20, scope: !29)
!34 = !DILocation(line: 34, column: 20, scope: !35)
!35 = distinct !DILexicalBlock(scope: !29, file: !10, line: 34, column: 13)
!36 = !DILocation(line: 34, column: 18, scope: !35)
!37 = !DILocation(line: 34, column: 25, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !10, line: 34, column: 13)
!39 = !DILocation(line: 34, column: 27, scope: !38)
!40 = !DILocation(line: 34, column: 13, scope: !35)
!41 = !DILocation(line: 36, column: 34, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !10, line: 35, column: 13)
!43 = !DILocation(line: 36, column: 27, scope: !42)
!44 = !DILocation(line: 36, column: 17, scope: !42)
!45 = !DILocation(line: 36, column: 22, scope: !42)
!46 = !DILocation(line: 36, column: 25, scope: !42)
!47 = !DILocation(line: 37, column: 13, scope: !42)
!48 = !DILocation(line: 34, column: 35, scope: !38)
!49 = !DILocation(line: 34, column: 13, scope: !38)
!50 = distinct !{!50, !40, !51, !52}
!51 = !DILocation(line: 37, column: 13, scope: !35)
!52 = !{!"llvm.loop.mustprogress"}
!53 = !DILocation(line: 38, column: 31, scope: !29)
!54 = !DILocation(line: 38, column: 13, scope: !29)
!55 = !DILocation(line: 39, column: 18, scope: !29)
!56 = !DILocation(line: 39, column: 13, scope: !29)
!57 = !DILocation(line: 42, column: 1, scope: !9)
!58 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_68b_goodG2BSink", scope: !10, file: !10, line: 49, type: !11, scopeLine: 50, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocalVariable(name: "data", scope: !58, file: !10, line: 51, type: !14)
!60 = !DILocation(line: 51, column: 15, scope: !58)
!61 = !DILocation(line: 51, column: 22, scope: !58)
!62 = !DILocalVariable(name: "source", scope: !63, file: !10, line: 53, type: !24)
!63 = distinct !DILexicalBlock(scope: !58, file: !10, line: 52, column: 5)
!64 = !DILocation(line: 53, column: 17, scope: !63)
!65 = !DILocalVariable(name: "i", scope: !66, file: !10, line: 55, type: !30)
!66 = distinct !DILexicalBlock(scope: !63, file: !10, line: 54, column: 9)
!67 = !DILocation(line: 55, column: 20, scope: !66)
!68 = !DILocation(line: 57, column: 20, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !10, line: 57, column: 13)
!70 = !DILocation(line: 57, column: 18, scope: !69)
!71 = !DILocation(line: 57, column: 25, scope: !72)
!72 = distinct !DILexicalBlock(scope: !69, file: !10, line: 57, column: 13)
!73 = !DILocation(line: 57, column: 27, scope: !72)
!74 = !DILocation(line: 57, column: 13, scope: !69)
!75 = !DILocation(line: 59, column: 34, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !10, line: 58, column: 13)
!77 = !DILocation(line: 59, column: 27, scope: !76)
!78 = !DILocation(line: 59, column: 17, scope: !76)
!79 = !DILocation(line: 59, column: 22, scope: !76)
!80 = !DILocation(line: 59, column: 25, scope: !76)
!81 = !DILocation(line: 60, column: 13, scope: !76)
!82 = !DILocation(line: 57, column: 35, scope: !72)
!83 = !DILocation(line: 57, column: 13, scope: !72)
!84 = distinct !{!84, !74, !85, !52}
!85 = !DILocation(line: 60, column: 13, scope: !69)
!86 = !DILocation(line: 61, column: 31, scope: !66)
!87 = !DILocation(line: 61, column: 13, scope: !66)
!88 = !DILocation(line: 62, column: 18, scope: !66)
!89 = !DILocation(line: 62, column: 13, scope: !66)
!90 = !DILocation(line: 65, column: 1, scope: !58)
