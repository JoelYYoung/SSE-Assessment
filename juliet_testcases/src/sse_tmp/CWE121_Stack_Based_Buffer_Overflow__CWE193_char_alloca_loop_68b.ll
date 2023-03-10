; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_68b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_68b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_68_badData = external dso_local global i8*, align 8
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_68b_badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_68_goodG2BData = external dso_local global i8*, align 8
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_68b_goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_68b_badSink() #0 !dbg !9 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !13, metadata !DIExpression()), !dbg !16
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_68_badData, align 8, !dbg !17
  store i8* %0, i8** %data, align 8, !dbg !16
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !18, metadata !DIExpression()), !dbg !23
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !23
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_68b_badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !23
  call void @llvm.dbg.declare(metadata i64* %i, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !29, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !31
  %call = call i64 @strlen(i8* %arraydecay) #5, !dbg !32
  store i64 %call, i64* %sourceLen, align 8, !dbg !33
  store i64 0, i64* %i, align 8, !dbg !34
  br label %for.cond, !dbg !36

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !37
  %3 = load i64, i64* %sourceLen, align 8, !dbg !39
  %add = add i64 %3, 1, !dbg !40
  %cmp = icmp ult i64 %2, %add, !dbg !41
  br i1 %cmp, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !43
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !45
  %5 = load i8, i8* %arrayidx, align 1, !dbg !45
  %6 = load i8*, i8** %data, align 8, !dbg !46
  %7 = load i64, i64* %i, align 8, !dbg !47
  %arrayidx1 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !46
  store i8 %5, i8* %arrayidx1, align 1, !dbg !48
  br label %for.inc, !dbg !49

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !50
  %inc = add i64 %8, 1, !dbg !50
  store i64 %inc, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !55
  call void @printLine(i8* %9), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_68b_goodG2BSink() #0 !dbg !58 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !59, metadata !DIExpression()), !dbg !60
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_68_goodG2BData, align 8, !dbg !61
  store i8* %0, i8** %data, align 8, !dbg !60
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !62, metadata !DIExpression()), !dbg !64
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_68b_goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !64
  call void @llvm.dbg.declare(metadata i64* %i, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !67, metadata !DIExpression()), !dbg !68
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !69
  %call = call i64 @strlen(i8* %arraydecay) #5, !dbg !70
  store i64 %call, i64* %sourceLen, align 8, !dbg !71
  store i64 0, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !74

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !75
  %3 = load i64, i64* %sourceLen, align 8, !dbg !77
  %add = add i64 %3, 1, !dbg !78
  %cmp = icmp ult i64 %2, %add, !dbg !79
  br i1 %cmp, label %for.body, label %for.end, !dbg !80

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !81
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !83
  %5 = load i8, i8* %arrayidx, align 1, !dbg !83
  %6 = load i8*, i8** %data, align 8, !dbg !84
  %7 = load i64, i64* %i, align 8, !dbg !85
  %arrayidx1 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !84
  store i8 %5, i8* %arrayidx1, align 1, !dbg !86
  br label %for.inc, !dbg !87

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !88
  %inc = add i64 %8, 1, !dbg !88
  store i64 %inc, i64* %i, align 8, !dbg !88
  br label %for.cond, !dbg !89, !llvm.loop !90

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !92
  call void @printLine(i8* %9), !dbg !93
  ret void, !dbg !94
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_68b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_68b_badSink", scope: !10, file: !10, line: 33, type: !11, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_68b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 35, type: !14)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DILocation(line: 35, column: 12, scope: !9)
!17 = !DILocation(line: 35, column: 19, scope: !9)
!18 = !DILocalVariable(name: "source", scope: !19, file: !10, line: 37, type: !20)
!19 = distinct !DILexicalBlock(scope: !9, file: !10, line: 36, column: 5)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 88, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 11)
!23 = !DILocation(line: 37, column: 14, scope: !19)
!24 = !DILocalVariable(name: "i", scope: !19, file: !10, line: 38, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !26, line: 46, baseType: !27)
!26 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!27 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!28 = !DILocation(line: 38, column: 16, scope: !19)
!29 = !DILocalVariable(name: "sourceLen", scope: !19, file: !10, line: 38, type: !25)
!30 = !DILocation(line: 38, column: 19, scope: !19)
!31 = !DILocation(line: 39, column: 28, scope: !19)
!32 = !DILocation(line: 39, column: 21, scope: !19)
!33 = !DILocation(line: 39, column: 19, scope: !19)
!34 = !DILocation(line: 42, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !19, file: !10, line: 42, column: 9)
!36 = !DILocation(line: 42, column: 14, scope: !35)
!37 = !DILocation(line: 42, column: 21, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !10, line: 42, column: 9)
!39 = !DILocation(line: 42, column: 25, scope: !38)
!40 = !DILocation(line: 42, column: 35, scope: !38)
!41 = !DILocation(line: 42, column: 23, scope: !38)
!42 = !DILocation(line: 42, column: 9, scope: !35)
!43 = !DILocation(line: 44, column: 30, scope: !44)
!44 = distinct !DILexicalBlock(scope: !38, file: !10, line: 43, column: 9)
!45 = !DILocation(line: 44, column: 23, scope: !44)
!46 = !DILocation(line: 44, column: 13, scope: !44)
!47 = !DILocation(line: 44, column: 18, scope: !44)
!48 = !DILocation(line: 44, column: 21, scope: !44)
!49 = !DILocation(line: 45, column: 9, scope: !44)
!50 = !DILocation(line: 42, column: 41, scope: !38)
!51 = !DILocation(line: 42, column: 9, scope: !38)
!52 = distinct !{!52, !42, !53, !54}
!53 = !DILocation(line: 45, column: 9, scope: !35)
!54 = !{!"llvm.loop.mustprogress"}
!55 = !DILocation(line: 46, column: 19, scope: !19)
!56 = !DILocation(line: 46, column: 9, scope: !19)
!57 = !DILocation(line: 48, column: 1, scope: !9)
!58 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_68b_goodG2BSink", scope: !10, file: !10, line: 55, type: !11, scopeLine: 56, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocalVariable(name: "data", scope: !58, file: !10, line: 57, type: !14)
!60 = !DILocation(line: 57, column: 12, scope: !58)
!61 = !DILocation(line: 57, column: 19, scope: !58)
!62 = !DILocalVariable(name: "source", scope: !63, file: !10, line: 59, type: !20)
!63 = distinct !DILexicalBlock(scope: !58, file: !10, line: 58, column: 5)
!64 = !DILocation(line: 59, column: 14, scope: !63)
!65 = !DILocalVariable(name: "i", scope: !63, file: !10, line: 60, type: !25)
!66 = !DILocation(line: 60, column: 16, scope: !63)
!67 = !DILocalVariable(name: "sourceLen", scope: !63, file: !10, line: 60, type: !25)
!68 = !DILocation(line: 60, column: 19, scope: !63)
!69 = !DILocation(line: 61, column: 28, scope: !63)
!70 = !DILocation(line: 61, column: 21, scope: !63)
!71 = !DILocation(line: 61, column: 19, scope: !63)
!72 = !DILocation(line: 64, column: 16, scope: !73)
!73 = distinct !DILexicalBlock(scope: !63, file: !10, line: 64, column: 9)
!74 = !DILocation(line: 64, column: 14, scope: !73)
!75 = !DILocation(line: 64, column: 21, scope: !76)
!76 = distinct !DILexicalBlock(scope: !73, file: !10, line: 64, column: 9)
!77 = !DILocation(line: 64, column: 25, scope: !76)
!78 = !DILocation(line: 64, column: 35, scope: !76)
!79 = !DILocation(line: 64, column: 23, scope: !76)
!80 = !DILocation(line: 64, column: 9, scope: !73)
!81 = !DILocation(line: 66, column: 30, scope: !82)
!82 = distinct !DILexicalBlock(scope: !76, file: !10, line: 65, column: 9)
!83 = !DILocation(line: 66, column: 23, scope: !82)
!84 = !DILocation(line: 66, column: 13, scope: !82)
!85 = !DILocation(line: 66, column: 18, scope: !82)
!86 = !DILocation(line: 66, column: 21, scope: !82)
!87 = !DILocation(line: 67, column: 9, scope: !82)
!88 = !DILocation(line: 64, column: 41, scope: !76)
!89 = !DILocation(line: 64, column: 9, scope: !76)
!90 = distinct !{!90, !80, !91, !54}
!91 = !DILocation(line: 67, column: 9, scope: !73)
!92 = !DILocation(line: 68, column: 19, scope: !63)
!93 = !DILocation(line: 68, column: 9, scope: !63)
!94 = !DILocation(line: 70, column: 1, scope: !58)
