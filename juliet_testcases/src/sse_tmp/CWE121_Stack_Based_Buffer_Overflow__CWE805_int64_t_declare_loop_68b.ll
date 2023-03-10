; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_68b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_68b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_68_badData = external dso_local global i64*, align 8
@CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_68_goodG2BData = external dso_local global i64*, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_68b_badSink() #0 !dbg !9 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !13, metadata !DIExpression()), !dbg !20
  %0 = load i64*, i64** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_68_badData, align 8, !dbg !21
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
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_68b_goodG2BSink() #0 !dbg !56 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !57, metadata !DIExpression()), !dbg !58
  %0 = load i64*, i64** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_68_goodG2BData, align 8, !dbg !59
  store i64* %0, i64** %data, align 8, !dbg !58
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !60, metadata !DIExpression()), !dbg !62
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !62
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !62
  call void @llvm.dbg.declare(metadata i64* %i, metadata !63, metadata !DIExpression()), !dbg !65
  store i64 0, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !68

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !69
  %cmp = icmp ult i64 %2, 100, !dbg !71
  br i1 %cmp, label %for.body, label %for.end, !dbg !72

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !73
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %3, !dbg !75
  %4 = load i64, i64* %arrayidx, align 8, !dbg !75
  %5 = load i64*, i64** %data, align 8, !dbg !76
  %6 = load i64, i64* %i, align 8, !dbg !77
  %arrayidx1 = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !76
  store i64 %4, i64* %arrayidx1, align 8, !dbg !78
  br label %for.inc, !dbg !79

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !80
  %inc = add i64 %7, 1, !dbg !80
  store i64 %inc, i64* %i, align 8, !dbg !80
  br label %for.cond, !dbg !81, !llvm.loop !82

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %data, align 8, !dbg !84
  %arrayidx2 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !84
  %9 = load i64, i64* %arrayidx2, align 8, !dbg !84
  call void @printLongLongLine(i64 %9), !dbg !85
  ret void, !dbg !86
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_68b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_68b_badSink", scope: !10, file: !10, line: 26, type: !11, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_68b.c", directory: "/home/joelyang/SSE-Assessment")
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
!55 = !DILocation(line: 41, column: 1, scope: !9)
!56 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_68b_goodG2BSink", scope: !10, file: !10, line: 48, type: !11, scopeLine: 49, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocalVariable(name: "data", scope: !56, file: !10, line: 50, type: !14)
!58 = !DILocation(line: 50, column: 15, scope: !56)
!59 = !DILocation(line: 50, column: 22, scope: !56)
!60 = !DILocalVariable(name: "source", scope: !61, file: !10, line: 52, type: !24)
!61 = distinct !DILexicalBlock(scope: !56, file: !10, line: 51, column: 5)
!62 = !DILocation(line: 52, column: 17, scope: !61)
!63 = !DILocalVariable(name: "i", scope: !64, file: !10, line: 54, type: !30)
!64 = distinct !DILexicalBlock(scope: !61, file: !10, line: 53, column: 9)
!65 = !DILocation(line: 54, column: 20, scope: !64)
!66 = !DILocation(line: 56, column: 20, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !10, line: 56, column: 13)
!68 = !DILocation(line: 56, column: 18, scope: !67)
!69 = !DILocation(line: 56, column: 25, scope: !70)
!70 = distinct !DILexicalBlock(scope: !67, file: !10, line: 56, column: 13)
!71 = !DILocation(line: 56, column: 27, scope: !70)
!72 = !DILocation(line: 56, column: 13, scope: !67)
!73 = !DILocation(line: 58, column: 34, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !10, line: 57, column: 13)
!75 = !DILocation(line: 58, column: 27, scope: !74)
!76 = !DILocation(line: 58, column: 17, scope: !74)
!77 = !DILocation(line: 58, column: 22, scope: !74)
!78 = !DILocation(line: 58, column: 25, scope: !74)
!79 = !DILocation(line: 59, column: 13, scope: !74)
!80 = !DILocation(line: 56, column: 35, scope: !70)
!81 = !DILocation(line: 56, column: 13, scope: !70)
!82 = distinct !{!82, !72, !83, !52}
!83 = !DILocation(line: 59, column: 13, scope: !67)
!84 = !DILocation(line: 60, column: 31, scope: !64)
!85 = !DILocation(line: 60, column: 13, scope: !64)
!86 = !DILocation(line: 63, column: 1, scope: !56)
