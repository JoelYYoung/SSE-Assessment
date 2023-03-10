; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_51b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_51b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_51b_badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_51b_goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_51b_badSink(i32* %data) #0 !dbg !9 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !19, metadata !DIExpression()), !dbg !24
  %0 = bitcast [11 x i32]* %source to i8*, !dbg !24
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_51b_badSink.source to i8*), i64 44, i1 false), !dbg !24
  call void @llvm.dbg.declare(metadata i64* %i, metadata !25, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !29, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !31
  %call = call i64 @wcslen(i32* %arraydecay) #5, !dbg !32
  store i64 %call, i64* %sourceLen, align 8, !dbg !33
  store i64 0, i64* %i, align 8, !dbg !34
  br label %for.cond, !dbg !36

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !37
  %2 = load i64, i64* %sourceLen, align 8, !dbg !39
  %add = add i64 %2, 1, !dbg !40
  %cmp = icmp ult i64 %1, %add, !dbg !41
  br i1 %cmp, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !43
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %3, !dbg !45
  %4 = load i32, i32* %arrayidx, align 4, !dbg !45
  %5 = load i32*, i32** %data.addr, align 8, !dbg !46
  %6 = load i64, i64* %i, align 8, !dbg !47
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !46
  store i32 %4, i32* %arrayidx1, align 4, !dbg !48
  br label %for.inc, !dbg !49

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !50
  %inc = add i64 %7, 1, !dbg !50
  store i64 %inc, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data.addr, align 8, !dbg !55
  call void @printWLine(i32* %8), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_51b_goodG2BSink(i32* %data) #0 !dbg !58 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !59, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !61, metadata !DIExpression()), !dbg !63
  %0 = bitcast [11 x i32]* %source to i8*, !dbg !63
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_51b_goodG2BSink.source to i8*), i64 44, i1 false), !dbg !63
  call void @llvm.dbg.declare(metadata i64* %i, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !66, metadata !DIExpression()), !dbg !67
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !68
  %call = call i64 @wcslen(i32* %arraydecay) #5, !dbg !69
  store i64 %call, i64* %sourceLen, align 8, !dbg !70
  store i64 0, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !73

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !74
  %2 = load i64, i64* %sourceLen, align 8, !dbg !76
  %add = add i64 %2, 1, !dbg !77
  %cmp = icmp ult i64 %1, %add, !dbg !78
  br i1 %cmp, label %for.body, label %for.end, !dbg !79

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !80
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %3, !dbg !82
  %4 = load i32, i32* %arrayidx, align 4, !dbg !82
  %5 = load i32*, i32** %data.addr, align 8, !dbg !83
  %6 = load i64, i64* %i, align 8, !dbg !84
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !83
  store i32 %4, i32* %arrayidx1, align 4, !dbg !85
  br label %for.inc, !dbg !86

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !87
  %inc = add i64 %7, 1, !dbg !87
  store i64 %inc, i64* %i, align 8, !dbg !87
  br label %for.cond, !dbg !88, !llvm.loop !89

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data.addr, align 8, !dbg !91
  call void @printWLine(i32* %8), !dbg !92
  ret void, !dbg !93
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_51b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_51b_badSink", scope: !10, file: !10, line: 30, type: !11, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_51b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !15, line: 74, baseType: !16)
!15 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocalVariable(name: "data", arg: 1, scope: !9, file: !10, line: 30, type: !13)
!18 = !DILocation(line: 30, column: 91, scope: !9)
!19 = !DILocalVariable(name: "source", scope: !20, file: !10, line: 33, type: !21)
!20 = distinct !DILexicalBlock(scope: !9, file: !10, line: 32, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 352, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 11)
!24 = !DILocation(line: 33, column: 17, scope: !20)
!25 = !DILocalVariable(name: "i", scope: !20, file: !10, line: 34, type: !26)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !15, line: 46, baseType: !27)
!27 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!28 = !DILocation(line: 34, column: 16, scope: !20)
!29 = !DILocalVariable(name: "sourceLen", scope: !20, file: !10, line: 34, type: !26)
!30 = !DILocation(line: 34, column: 19, scope: !20)
!31 = !DILocation(line: 35, column: 28, scope: !20)
!32 = !DILocation(line: 35, column: 21, scope: !20)
!33 = !DILocation(line: 35, column: 19, scope: !20)
!34 = !DILocation(line: 38, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !20, file: !10, line: 38, column: 9)
!36 = !DILocation(line: 38, column: 14, scope: !35)
!37 = !DILocation(line: 38, column: 21, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !10, line: 38, column: 9)
!39 = !DILocation(line: 38, column: 25, scope: !38)
!40 = !DILocation(line: 38, column: 35, scope: !38)
!41 = !DILocation(line: 38, column: 23, scope: !38)
!42 = !DILocation(line: 38, column: 9, scope: !35)
!43 = !DILocation(line: 40, column: 30, scope: !44)
!44 = distinct !DILexicalBlock(scope: !38, file: !10, line: 39, column: 9)
!45 = !DILocation(line: 40, column: 23, scope: !44)
!46 = !DILocation(line: 40, column: 13, scope: !44)
!47 = !DILocation(line: 40, column: 18, scope: !44)
!48 = !DILocation(line: 40, column: 21, scope: !44)
!49 = !DILocation(line: 41, column: 9, scope: !44)
!50 = !DILocation(line: 38, column: 41, scope: !38)
!51 = !DILocation(line: 38, column: 9, scope: !38)
!52 = distinct !{!52, !42, !53, !54}
!53 = !DILocation(line: 41, column: 9, scope: !35)
!54 = !{!"llvm.loop.mustprogress"}
!55 = !DILocation(line: 42, column: 20, scope: !20)
!56 = !DILocation(line: 42, column: 9, scope: !20)
!57 = !DILocation(line: 44, column: 1, scope: !9)
!58 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_51b_goodG2BSink", scope: !10, file: !10, line: 51, type: !11, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocalVariable(name: "data", arg: 1, scope: !58, file: !10, line: 51, type: !13)
!60 = !DILocation(line: 51, column: 95, scope: !58)
!61 = !DILocalVariable(name: "source", scope: !62, file: !10, line: 54, type: !21)
!62 = distinct !DILexicalBlock(scope: !58, file: !10, line: 53, column: 5)
!63 = !DILocation(line: 54, column: 17, scope: !62)
!64 = !DILocalVariable(name: "i", scope: !62, file: !10, line: 55, type: !26)
!65 = !DILocation(line: 55, column: 16, scope: !62)
!66 = !DILocalVariable(name: "sourceLen", scope: !62, file: !10, line: 55, type: !26)
!67 = !DILocation(line: 55, column: 19, scope: !62)
!68 = !DILocation(line: 56, column: 28, scope: !62)
!69 = !DILocation(line: 56, column: 21, scope: !62)
!70 = !DILocation(line: 56, column: 19, scope: !62)
!71 = !DILocation(line: 59, column: 16, scope: !72)
!72 = distinct !DILexicalBlock(scope: !62, file: !10, line: 59, column: 9)
!73 = !DILocation(line: 59, column: 14, scope: !72)
!74 = !DILocation(line: 59, column: 21, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !10, line: 59, column: 9)
!76 = !DILocation(line: 59, column: 25, scope: !75)
!77 = !DILocation(line: 59, column: 35, scope: !75)
!78 = !DILocation(line: 59, column: 23, scope: !75)
!79 = !DILocation(line: 59, column: 9, scope: !72)
!80 = !DILocation(line: 61, column: 30, scope: !81)
!81 = distinct !DILexicalBlock(scope: !75, file: !10, line: 60, column: 9)
!82 = !DILocation(line: 61, column: 23, scope: !81)
!83 = !DILocation(line: 61, column: 13, scope: !81)
!84 = !DILocation(line: 61, column: 18, scope: !81)
!85 = !DILocation(line: 61, column: 21, scope: !81)
!86 = !DILocation(line: 62, column: 9, scope: !81)
!87 = !DILocation(line: 59, column: 41, scope: !75)
!88 = !DILocation(line: 59, column: 9, scope: !75)
!89 = distinct !{!89, !79, !90, !54}
!90 = !DILocation(line: 62, column: 9, scope: !72)
!91 = !DILocation(line: 63, column: 20, scope: !62)
!92 = !DILocation(line: 63, column: 9, scope: !62)
!93 = !DILocation(line: 65, column: 1, scope: !58)
