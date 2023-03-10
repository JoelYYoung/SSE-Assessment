; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_68b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_68b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_68_badData = external dso_local global i32*, align 8
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_68_goodG2BData = external dso_local global i32*, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_68b_badSink() #0 !dbg !9 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !13, metadata !DIExpression()), !dbg !16
  %0 = load i32*, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_68_badData, align 8, !dbg !17
  store i32* %0, i32** %data, align 8, !dbg !16
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !18, metadata !DIExpression()), !dbg !23
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !23
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !23
  call void @llvm.dbg.declare(metadata i64* %i, metadata !24, metadata !DIExpression()), !dbg !29
  store i64 0, i64* %i, align 8, !dbg !30
  br label %for.cond, !dbg !32

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !33
  %cmp = icmp ult i64 %2, 100, !dbg !35
  br i1 %cmp, label %for.body, label %for.end, !dbg !36

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !37
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !39
  %4 = load i32, i32* %arrayidx, align 4, !dbg !39
  %5 = load i32*, i32** %data, align 8, !dbg !40
  %6 = load i64, i64* %i, align 8, !dbg !41
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !40
  store i32 %4, i32* %arrayidx1, align 4, !dbg !42
  br label %for.inc, !dbg !43

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !44
  %inc = add i64 %7, 1, !dbg !44
  store i64 %inc, i64* %i, align 8, !dbg !44
  br label %for.cond, !dbg !45, !llvm.loop !46

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !49
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !49
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !49
  call void @printIntLine(i32 %9), !dbg !50
  %10 = load i32*, i32** %data, align 8, !dbg !51
  %11 = bitcast i32* %10 to i8*, !dbg !51
  call void @free(i8* %11) #5, !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_68b_goodG2BSink() #0 !dbg !54 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !55, metadata !DIExpression()), !dbg !56
  %0 = load i32*, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_68_goodG2BData, align 8, !dbg !57
  store i32* %0, i32** %data, align 8, !dbg !56
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !58, metadata !DIExpression()), !dbg !60
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !60
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !60
  call void @llvm.dbg.declare(metadata i64* %i, metadata !61, metadata !DIExpression()), !dbg !63
  store i64 0, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !66

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !67
  %cmp = icmp ult i64 %2, 100, !dbg !69
  br i1 %cmp, label %for.body, label %for.end, !dbg !70

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !73
  %4 = load i32, i32* %arrayidx, align 4, !dbg !73
  %5 = load i32*, i32** %data, align 8, !dbg !74
  %6 = load i64, i64* %i, align 8, !dbg !75
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !74
  store i32 %4, i32* %arrayidx1, align 4, !dbg !76
  br label %for.inc, !dbg !77

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !78
  %inc = add i64 %7, 1, !dbg !78
  store i64 %inc, i64* %i, align 8, !dbg !78
  br label %for.cond, !dbg !79, !llvm.loop !80

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !82
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !82
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !82
  call void @printIntLine(i32 %9), !dbg !83
  %10 = load i32*, i32** %data, align 8, !dbg !84
  %11 = bitcast i32* %10 to i8*, !dbg !84
  call void @free(i8* %11) #5, !dbg !85
  ret void, !dbg !86
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_68b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_68b_badSink", scope: !10, file: !10, line: 26, type: !11, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_68b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 28, type: !14)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !DILocation(line: 28, column: 11, scope: !9)
!17 = !DILocation(line: 28, column: 18, scope: !9)
!18 = !DILocalVariable(name: "source", scope: !19, file: !10, line: 30, type: !20)
!19 = distinct !DILexicalBlock(scope: !9, file: !10, line: 29, column: 5)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 3200, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 100)
!23 = !DILocation(line: 30, column: 13, scope: !19)
!24 = !DILocalVariable(name: "i", scope: !25, file: !10, line: 32, type: !26)
!25 = distinct !DILexicalBlock(scope: !19, file: !10, line: 31, column: 9)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !27, line: 46, baseType: !28)
!27 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!28 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!29 = !DILocation(line: 32, column: 20, scope: !25)
!30 = !DILocation(line: 34, column: 20, scope: !31)
!31 = distinct !DILexicalBlock(scope: !25, file: !10, line: 34, column: 13)
!32 = !DILocation(line: 34, column: 18, scope: !31)
!33 = !DILocation(line: 34, column: 25, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !10, line: 34, column: 13)
!35 = !DILocation(line: 34, column: 27, scope: !34)
!36 = !DILocation(line: 34, column: 13, scope: !31)
!37 = !DILocation(line: 36, column: 34, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !10, line: 35, column: 13)
!39 = !DILocation(line: 36, column: 27, scope: !38)
!40 = !DILocation(line: 36, column: 17, scope: !38)
!41 = !DILocation(line: 36, column: 22, scope: !38)
!42 = !DILocation(line: 36, column: 25, scope: !38)
!43 = !DILocation(line: 37, column: 13, scope: !38)
!44 = !DILocation(line: 34, column: 35, scope: !34)
!45 = !DILocation(line: 34, column: 13, scope: !34)
!46 = distinct !{!46, !36, !47, !48}
!47 = !DILocation(line: 37, column: 13, scope: !31)
!48 = !{!"llvm.loop.mustprogress"}
!49 = !DILocation(line: 38, column: 26, scope: !25)
!50 = !DILocation(line: 38, column: 13, scope: !25)
!51 = !DILocation(line: 39, column: 18, scope: !25)
!52 = !DILocation(line: 39, column: 13, scope: !25)
!53 = !DILocation(line: 42, column: 1, scope: !9)
!54 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_68b_goodG2BSink", scope: !10, file: !10, line: 49, type: !11, scopeLine: 50, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocalVariable(name: "data", scope: !54, file: !10, line: 51, type: !14)
!56 = !DILocation(line: 51, column: 11, scope: !54)
!57 = !DILocation(line: 51, column: 18, scope: !54)
!58 = !DILocalVariable(name: "source", scope: !59, file: !10, line: 53, type: !20)
!59 = distinct !DILexicalBlock(scope: !54, file: !10, line: 52, column: 5)
!60 = !DILocation(line: 53, column: 13, scope: !59)
!61 = !DILocalVariable(name: "i", scope: !62, file: !10, line: 55, type: !26)
!62 = distinct !DILexicalBlock(scope: !59, file: !10, line: 54, column: 9)
!63 = !DILocation(line: 55, column: 20, scope: !62)
!64 = !DILocation(line: 57, column: 20, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !10, line: 57, column: 13)
!66 = !DILocation(line: 57, column: 18, scope: !65)
!67 = !DILocation(line: 57, column: 25, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !10, line: 57, column: 13)
!69 = !DILocation(line: 57, column: 27, scope: !68)
!70 = !DILocation(line: 57, column: 13, scope: !65)
!71 = !DILocation(line: 59, column: 34, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !10, line: 58, column: 13)
!73 = !DILocation(line: 59, column: 27, scope: !72)
!74 = !DILocation(line: 59, column: 17, scope: !72)
!75 = !DILocation(line: 59, column: 22, scope: !72)
!76 = !DILocation(line: 59, column: 25, scope: !72)
!77 = !DILocation(line: 60, column: 13, scope: !72)
!78 = !DILocation(line: 57, column: 35, scope: !68)
!79 = !DILocation(line: 57, column: 13, scope: !68)
!80 = distinct !{!80, !70, !81, !48}
!81 = !DILocation(line: 60, column: 13, scope: !65)
!82 = !DILocation(line: 61, column: 26, scope: !62)
!83 = !DILocation(line: 61, column: 13, scope: !62)
!84 = !DILocation(line: 62, column: 18, scope: !62)
!85 = !DILocation(line: 62, column: 13, scope: !62)
!86 = !DILocation(line: 65, column: 1, scope: !54)
