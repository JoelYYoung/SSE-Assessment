; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_66b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_66b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_66b_badSink(i64** %dataArray) #0 !dbg !9 {
entry:
  %dataArray.addr = alloca i64**, align 8
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  store i64** %dataArray, i64*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i64*** %dataArray.addr, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = load i64**, i64*** %dataArray.addr, align 8, !dbg !24
  %arrayidx = getelementptr inbounds i64*, i64** %0, i64 2, !dbg !24
  %1 = load i64*, i64** %arrayidx, align 8, !dbg !24
  store i64* %1, i64** %data, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !25, metadata !DIExpression()), !dbg !30
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !30
  call void @llvm.dbg.declare(metadata i64* %i, metadata !31, metadata !DIExpression()), !dbg !36
  store i64 0, i64* %i, align 8, !dbg !37
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !40
  %cmp = icmp ult i64 %3, 100, !dbg !42
  br i1 %cmp, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !44
  %arrayidx1 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %4, !dbg !46
  %5 = load i64, i64* %arrayidx1, align 8, !dbg !46
  %6 = load i64*, i64** %data, align 8, !dbg !47
  %7 = load i64, i64* %i, align 8, !dbg !48
  %arrayidx2 = getelementptr inbounds i64, i64* %6, i64 %7, !dbg !47
  store i64 %5, i64* %arrayidx2, align 8, !dbg !49
  br label %for.inc, !dbg !50

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !51
  %inc = add i64 %8, 1, !dbg !51
  store i64 %inc, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !52, !llvm.loop !53

for.end:                                          ; preds = %for.cond
  %9 = load i64*, i64** %data, align 8, !dbg !56
  %arrayidx3 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !56
  %10 = load i64, i64* %arrayidx3, align 8, !dbg !56
  call void @printLongLongLine(i64 %10), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_66b_goodG2BSink(i64** %dataArray) #0 !dbg !59 {
entry:
  %dataArray.addr = alloca i64**, align 8
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  store i64** %dataArray, i64*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i64*** %dataArray.addr, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata i64** %data, metadata !62, metadata !DIExpression()), !dbg !63
  %0 = load i64**, i64*** %dataArray.addr, align 8, !dbg !64
  %arrayidx = getelementptr inbounds i64*, i64** %0, i64 2, !dbg !64
  %1 = load i64*, i64** %arrayidx, align 8, !dbg !64
  store i64* %1, i64** %data, align 8, !dbg !63
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !65, metadata !DIExpression()), !dbg !67
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !67
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !67
  call void @llvm.dbg.declare(metadata i64* %i, metadata !68, metadata !DIExpression()), !dbg !70
  store i64 0, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !73

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !74
  %cmp = icmp ult i64 %3, 100, !dbg !76
  br i1 %cmp, label %for.body, label %for.end, !dbg !77

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !78
  %arrayidx1 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %4, !dbg !80
  %5 = load i64, i64* %arrayidx1, align 8, !dbg !80
  %6 = load i64*, i64** %data, align 8, !dbg !81
  %7 = load i64, i64* %i, align 8, !dbg !82
  %arrayidx2 = getelementptr inbounds i64, i64* %6, i64 %7, !dbg !81
  store i64 %5, i64* %arrayidx2, align 8, !dbg !83
  br label %for.inc, !dbg !84

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !85
  %inc = add i64 %8, 1, !dbg !85
  store i64 %inc, i64* %i, align 8, !dbg !85
  br label %for.cond, !dbg !86, !llvm.loop !87

for.end:                                          ; preds = %for.cond
  %9 = load i64*, i64** %data, align 8, !dbg !89
  %arrayidx3 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !89
  %10 = load i64, i64* %arrayidx3, align 8, !dbg !89
  call void @printLongLongLine(i64 %10), !dbg !90
  ret void, !dbg !91
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_66b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_66b_badSink", scope: !10, file: !10, line: 21, type: !11, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_66b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !16, line: 27, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !18, line: 44, baseType: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!19 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!20 = !DILocalVariable(name: "dataArray", arg: 1, scope: !9, file: !10, line: 21, type: !13)
!21 = !DILocation(line: 21, column: 91, scope: !9)
!22 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 24, type: !14)
!23 = !DILocation(line: 24, column: 15, scope: !9)
!24 = !DILocation(line: 24, column: 22, scope: !9)
!25 = !DILocalVariable(name: "source", scope: !26, file: !10, line: 26, type: !27)
!26 = distinct !DILexicalBlock(scope: !9, file: !10, line: 25, column: 5)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 6400, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 26, column: 17, scope: !26)
!31 = !DILocalVariable(name: "i", scope: !32, file: !10, line: 28, type: !33)
!32 = distinct !DILexicalBlock(scope: !26, file: !10, line: 27, column: 9)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !34, line: 46, baseType: !35)
!34 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!35 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!36 = !DILocation(line: 28, column: 20, scope: !32)
!37 = !DILocation(line: 30, column: 20, scope: !38)
!38 = distinct !DILexicalBlock(scope: !32, file: !10, line: 30, column: 13)
!39 = !DILocation(line: 30, column: 18, scope: !38)
!40 = !DILocation(line: 30, column: 25, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !10, line: 30, column: 13)
!42 = !DILocation(line: 30, column: 27, scope: !41)
!43 = !DILocation(line: 30, column: 13, scope: !38)
!44 = !DILocation(line: 32, column: 34, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !10, line: 31, column: 13)
!46 = !DILocation(line: 32, column: 27, scope: !45)
!47 = !DILocation(line: 32, column: 17, scope: !45)
!48 = !DILocation(line: 32, column: 22, scope: !45)
!49 = !DILocation(line: 32, column: 25, scope: !45)
!50 = !DILocation(line: 33, column: 13, scope: !45)
!51 = !DILocation(line: 30, column: 35, scope: !41)
!52 = !DILocation(line: 30, column: 13, scope: !41)
!53 = distinct !{!53, !43, !54, !55}
!54 = !DILocation(line: 33, column: 13, scope: !38)
!55 = !{!"llvm.loop.mustprogress"}
!56 = !DILocation(line: 34, column: 31, scope: !32)
!57 = !DILocation(line: 34, column: 13, scope: !32)
!58 = !DILocation(line: 37, column: 1, scope: !9)
!59 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_66b_goodG2BSink", scope: !10, file: !10, line: 44, type: !11, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocalVariable(name: "dataArray", arg: 1, scope: !59, file: !10, line: 44, type: !13)
!61 = !DILocation(line: 44, column: 95, scope: !59)
!62 = !DILocalVariable(name: "data", scope: !59, file: !10, line: 46, type: !14)
!63 = !DILocation(line: 46, column: 15, scope: !59)
!64 = !DILocation(line: 46, column: 22, scope: !59)
!65 = !DILocalVariable(name: "source", scope: !66, file: !10, line: 48, type: !27)
!66 = distinct !DILexicalBlock(scope: !59, file: !10, line: 47, column: 5)
!67 = !DILocation(line: 48, column: 17, scope: !66)
!68 = !DILocalVariable(name: "i", scope: !69, file: !10, line: 50, type: !33)
!69 = distinct !DILexicalBlock(scope: !66, file: !10, line: 49, column: 9)
!70 = !DILocation(line: 50, column: 20, scope: !69)
!71 = !DILocation(line: 52, column: 20, scope: !72)
!72 = distinct !DILexicalBlock(scope: !69, file: !10, line: 52, column: 13)
!73 = !DILocation(line: 52, column: 18, scope: !72)
!74 = !DILocation(line: 52, column: 25, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !10, line: 52, column: 13)
!76 = !DILocation(line: 52, column: 27, scope: !75)
!77 = !DILocation(line: 52, column: 13, scope: !72)
!78 = !DILocation(line: 54, column: 34, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !10, line: 53, column: 13)
!80 = !DILocation(line: 54, column: 27, scope: !79)
!81 = !DILocation(line: 54, column: 17, scope: !79)
!82 = !DILocation(line: 54, column: 22, scope: !79)
!83 = !DILocation(line: 54, column: 25, scope: !79)
!84 = !DILocation(line: 55, column: 13, scope: !79)
!85 = !DILocation(line: 52, column: 35, scope: !75)
!86 = !DILocation(line: 52, column: 13, scope: !75)
!87 = distinct !{!87, !77, !88, !55}
!88 = !DILocation(line: 55, column: 13, scope: !72)
!89 = !DILocation(line: 56, column: 31, scope: !69)
!90 = !DILocation(line: 56, column: 13, scope: !69)
!91 = !DILocation(line: 59, column: 1, scope: !59)
