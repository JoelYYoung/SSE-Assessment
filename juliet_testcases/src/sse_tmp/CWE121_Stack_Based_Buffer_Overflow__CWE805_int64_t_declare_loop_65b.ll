; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_65b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_65b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_65b_badSink(i64* %data) #0 !dbg !9 {
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
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_65b_goodG2BSink(i64* %data) #0 !dbg !55 {
entry:
  %data.addr = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !58, metadata !DIExpression()), !dbg !60
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !60
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !60
  call void @llvm.dbg.declare(metadata i64* %i, metadata !61, metadata !DIExpression()), !dbg !63
  store i64 0, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !66

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !67
  %cmp = icmp ult i64 %1, 100, !dbg !69
  br i1 %cmp, label %for.body, label %for.end, !dbg !70

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %2, !dbg !73
  %3 = load i64, i64* %arrayidx, align 8, !dbg !73
  %4 = load i64*, i64** %data.addr, align 8, !dbg !74
  %5 = load i64, i64* %i, align 8, !dbg !75
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !74
  store i64 %3, i64* %arrayidx1, align 8, !dbg !76
  br label %for.inc, !dbg !77

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !78
  %inc = add i64 %6, 1, !dbg !78
  store i64 %inc, i64* %i, align 8, !dbg !78
  br label %for.cond, !dbg !79, !llvm.loop !80

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %data.addr, align 8, !dbg !82
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !82
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !82
  call void @printLongLongLine(i64 %8), !dbg !83
  ret void, !dbg !84
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_65b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_65b_badSink", scope: !10, file: !10, line: 21, type: !11, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_65b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !15, line: 27, baseType: !16)
!15 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !17, line: 44, baseType: !18)
!17 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!18 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!19 = !DILocalVariable(name: "data", arg: 1, scope: !9, file: !10, line: 21, type: !13)
!20 = !DILocation(line: 21, column: 92, scope: !9)
!21 = !DILocalVariable(name: "source", scope: !22, file: !10, line: 24, type: !23)
!22 = distinct !DILexicalBlock(scope: !9, file: !10, line: 23, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 6400, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 100)
!26 = !DILocation(line: 24, column: 17, scope: !22)
!27 = !DILocalVariable(name: "i", scope: !28, file: !10, line: 26, type: !29)
!28 = distinct !DILexicalBlock(scope: !22, file: !10, line: 25, column: 9)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !30, line: 46, baseType: !31)
!30 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!31 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!32 = !DILocation(line: 26, column: 20, scope: !28)
!33 = !DILocation(line: 28, column: 20, scope: !34)
!34 = distinct !DILexicalBlock(scope: !28, file: !10, line: 28, column: 13)
!35 = !DILocation(line: 28, column: 18, scope: !34)
!36 = !DILocation(line: 28, column: 25, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !10, line: 28, column: 13)
!38 = !DILocation(line: 28, column: 27, scope: !37)
!39 = !DILocation(line: 28, column: 13, scope: !34)
!40 = !DILocation(line: 30, column: 34, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !10, line: 29, column: 13)
!42 = !DILocation(line: 30, column: 27, scope: !41)
!43 = !DILocation(line: 30, column: 17, scope: !41)
!44 = !DILocation(line: 30, column: 22, scope: !41)
!45 = !DILocation(line: 30, column: 25, scope: !41)
!46 = !DILocation(line: 31, column: 13, scope: !41)
!47 = !DILocation(line: 28, column: 35, scope: !37)
!48 = !DILocation(line: 28, column: 13, scope: !37)
!49 = distinct !{!49, !39, !50, !51}
!50 = !DILocation(line: 31, column: 13, scope: !34)
!51 = !{!"llvm.loop.mustprogress"}
!52 = !DILocation(line: 32, column: 31, scope: !28)
!53 = !DILocation(line: 32, column: 13, scope: !28)
!54 = !DILocation(line: 35, column: 1, scope: !9)
!55 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_65b_goodG2BSink", scope: !10, file: !10, line: 42, type: !11, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocalVariable(name: "data", arg: 1, scope: !55, file: !10, line: 42, type: !13)
!57 = !DILocation(line: 42, column: 96, scope: !55)
!58 = !DILocalVariable(name: "source", scope: !59, file: !10, line: 45, type: !23)
!59 = distinct !DILexicalBlock(scope: !55, file: !10, line: 44, column: 5)
!60 = !DILocation(line: 45, column: 17, scope: !59)
!61 = !DILocalVariable(name: "i", scope: !62, file: !10, line: 47, type: !29)
!62 = distinct !DILexicalBlock(scope: !59, file: !10, line: 46, column: 9)
!63 = !DILocation(line: 47, column: 20, scope: !62)
!64 = !DILocation(line: 49, column: 20, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !10, line: 49, column: 13)
!66 = !DILocation(line: 49, column: 18, scope: !65)
!67 = !DILocation(line: 49, column: 25, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !10, line: 49, column: 13)
!69 = !DILocation(line: 49, column: 27, scope: !68)
!70 = !DILocation(line: 49, column: 13, scope: !65)
!71 = !DILocation(line: 51, column: 34, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !10, line: 50, column: 13)
!73 = !DILocation(line: 51, column: 27, scope: !72)
!74 = !DILocation(line: 51, column: 17, scope: !72)
!75 = !DILocation(line: 51, column: 22, scope: !72)
!76 = !DILocation(line: 51, column: 25, scope: !72)
!77 = !DILocation(line: 52, column: 13, scope: !72)
!78 = !DILocation(line: 49, column: 35, scope: !68)
!79 = !DILocation(line: 49, column: 13, scope: !68)
!80 = distinct !{!80, !70, !81, !51}
!81 = !DILocation(line: 52, column: 13, scope: !65)
!82 = !DILocation(line: 53, column: 31, scope: !62)
!83 = !DILocation(line: 53, column: 13, scope: !62)
!84 = !DILocation(line: 56, column: 1, scope: !55)
