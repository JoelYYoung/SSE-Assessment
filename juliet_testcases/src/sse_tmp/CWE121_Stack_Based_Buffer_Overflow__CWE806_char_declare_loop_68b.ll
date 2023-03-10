; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_68b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_68b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_68_badData = external dso_local global i8*, align 8
@CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_68_goodG2BData = external dso_local global i8*, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_68b_badSink() #0 !dbg !9 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !13, metadata !DIExpression()), !dbg !16
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_68_badData, align 8, !dbg !17
  store i8* %0, i8** %data, align 8, !dbg !16
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !18, metadata !DIExpression()), !dbg !23
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !23
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !23
  call void @llvm.dbg.declare(metadata i64* %i, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !29, metadata !DIExpression()), !dbg !30
  %2 = load i8*, i8** %data, align 8, !dbg !31
  %call = call i64 @strlen(i8* %2) #5, !dbg !32
  store i64 %call, i64* %dataLen, align 8, !dbg !33
  store i64 0, i64* %i, align 8, !dbg !34
  br label %for.cond, !dbg !36

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !37
  %4 = load i64, i64* %dataLen, align 8, !dbg !39
  %cmp = icmp ult i64 %3, %4, !dbg !40
  br i1 %cmp, label %for.body, label %for.end, !dbg !41

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !42
  %6 = load i64, i64* %i, align 8, !dbg !44
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !42
  %7 = load i8, i8* %arrayidx, align 1, !dbg !42
  %8 = load i64, i64* %i, align 8, !dbg !45
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %8, !dbg !46
  store i8 %7, i8* %arrayidx1, align 1, !dbg !47
  br label %for.inc, !dbg !48

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !49
  %inc = add i64 %9, 1, !dbg !49
  store i64 %inc, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !50, !llvm.loop !51

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !54
  store i8 0, i8* %arrayidx2, align 1, !dbg !55
  %10 = load i8*, i8** %data, align 8, !dbg !56
  call void @printLine(i8* %10), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_68b_goodG2BSink() #0 !dbg !59 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !60, metadata !DIExpression()), !dbg !61
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_68_goodG2BData, align 8, !dbg !62
  store i8* %0, i8** %data, align 8, !dbg !61
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !63, metadata !DIExpression()), !dbg !65
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !65
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !65
  call void @llvm.dbg.declare(metadata i64* %i, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !68, metadata !DIExpression()), !dbg !69
  %2 = load i8*, i8** %data, align 8, !dbg !70
  %call = call i64 @strlen(i8* %2) #5, !dbg !71
  store i64 %call, i64* %dataLen, align 8, !dbg !72
  store i64 0, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !75

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !76
  %4 = load i64, i64* %dataLen, align 8, !dbg !78
  %cmp = icmp ult i64 %3, %4, !dbg !79
  br i1 %cmp, label %for.body, label %for.end, !dbg !80

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !81
  %6 = load i64, i64* %i, align 8, !dbg !83
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !81
  %7 = load i8, i8* %arrayidx, align 1, !dbg !81
  %8 = load i64, i64* %i, align 8, !dbg !84
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %8, !dbg !85
  store i8 %7, i8* %arrayidx1, align 1, !dbg !86
  br label %for.inc, !dbg !87

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !88
  %inc = add i64 %9, 1, !dbg !88
  store i64 %inc, i64* %i, align 8, !dbg !88
  br label %for.cond, !dbg !89, !llvm.loop !90

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !92
  store i8 0, i8* %arrayidx2, align 1, !dbg !93
  %10 = load i8*, i8** %data, align 8, !dbg !94
  call void @printLine(i8* %10), !dbg !95
  ret void, !dbg !96
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_68b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_68b_badSink", scope: !10, file: !10, line: 28, type: !11, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_68b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 30, type: !14)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DILocation(line: 30, column: 12, scope: !9)
!17 = !DILocation(line: 30, column: 19, scope: !9)
!18 = !DILocalVariable(name: "dest", scope: !19, file: !10, line: 32, type: !20)
!19 = distinct !DILexicalBlock(scope: !9, file: !10, line: 31, column: 5)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 400, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 50)
!23 = !DILocation(line: 32, column: 14, scope: !19)
!24 = !DILocalVariable(name: "i", scope: !19, file: !10, line: 33, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !26, line: 46, baseType: !27)
!26 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!27 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!28 = !DILocation(line: 33, column: 16, scope: !19)
!29 = !DILocalVariable(name: "dataLen", scope: !19, file: !10, line: 33, type: !25)
!30 = !DILocation(line: 33, column: 19, scope: !19)
!31 = !DILocation(line: 34, column: 26, scope: !19)
!32 = !DILocation(line: 34, column: 19, scope: !19)
!33 = !DILocation(line: 34, column: 17, scope: !19)
!34 = !DILocation(line: 36, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !19, file: !10, line: 36, column: 9)
!36 = !DILocation(line: 36, column: 14, scope: !35)
!37 = !DILocation(line: 36, column: 21, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !10, line: 36, column: 9)
!39 = !DILocation(line: 36, column: 25, scope: !38)
!40 = !DILocation(line: 36, column: 23, scope: !38)
!41 = !DILocation(line: 36, column: 9, scope: !35)
!42 = !DILocation(line: 38, column: 23, scope: !43)
!43 = distinct !DILexicalBlock(scope: !38, file: !10, line: 37, column: 9)
!44 = !DILocation(line: 38, column: 28, scope: !43)
!45 = !DILocation(line: 38, column: 18, scope: !43)
!46 = !DILocation(line: 38, column: 13, scope: !43)
!47 = !DILocation(line: 38, column: 21, scope: !43)
!48 = !DILocation(line: 39, column: 9, scope: !43)
!49 = !DILocation(line: 36, column: 35, scope: !38)
!50 = !DILocation(line: 36, column: 9, scope: !38)
!51 = distinct !{!51, !41, !52, !53}
!52 = !DILocation(line: 39, column: 9, scope: !35)
!53 = !{!"llvm.loop.mustprogress"}
!54 = !DILocation(line: 40, column: 9, scope: !19)
!55 = !DILocation(line: 40, column: 20, scope: !19)
!56 = !DILocation(line: 41, column: 19, scope: !19)
!57 = !DILocation(line: 41, column: 9, scope: !19)
!58 = !DILocation(line: 43, column: 1, scope: !9)
!59 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_68b_goodG2BSink", scope: !10, file: !10, line: 50, type: !11, scopeLine: 51, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocalVariable(name: "data", scope: !59, file: !10, line: 52, type: !14)
!61 = !DILocation(line: 52, column: 12, scope: !59)
!62 = !DILocation(line: 52, column: 19, scope: !59)
!63 = !DILocalVariable(name: "dest", scope: !64, file: !10, line: 54, type: !20)
!64 = distinct !DILexicalBlock(scope: !59, file: !10, line: 53, column: 5)
!65 = !DILocation(line: 54, column: 14, scope: !64)
!66 = !DILocalVariable(name: "i", scope: !64, file: !10, line: 55, type: !25)
!67 = !DILocation(line: 55, column: 16, scope: !64)
!68 = !DILocalVariable(name: "dataLen", scope: !64, file: !10, line: 55, type: !25)
!69 = !DILocation(line: 55, column: 19, scope: !64)
!70 = !DILocation(line: 56, column: 26, scope: !64)
!71 = !DILocation(line: 56, column: 19, scope: !64)
!72 = !DILocation(line: 56, column: 17, scope: !64)
!73 = !DILocation(line: 58, column: 16, scope: !74)
!74 = distinct !DILexicalBlock(scope: !64, file: !10, line: 58, column: 9)
!75 = !DILocation(line: 58, column: 14, scope: !74)
!76 = !DILocation(line: 58, column: 21, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !10, line: 58, column: 9)
!78 = !DILocation(line: 58, column: 25, scope: !77)
!79 = !DILocation(line: 58, column: 23, scope: !77)
!80 = !DILocation(line: 58, column: 9, scope: !74)
!81 = !DILocation(line: 60, column: 23, scope: !82)
!82 = distinct !DILexicalBlock(scope: !77, file: !10, line: 59, column: 9)
!83 = !DILocation(line: 60, column: 28, scope: !82)
!84 = !DILocation(line: 60, column: 18, scope: !82)
!85 = !DILocation(line: 60, column: 13, scope: !82)
!86 = !DILocation(line: 60, column: 21, scope: !82)
!87 = !DILocation(line: 61, column: 9, scope: !82)
!88 = !DILocation(line: 58, column: 35, scope: !77)
!89 = !DILocation(line: 58, column: 9, scope: !77)
!90 = distinct !{!90, !80, !91, !53}
!91 = !DILocation(line: 61, column: 9, scope: !74)
!92 = !DILocation(line: 62, column: 9, scope: !64)
!93 = !DILocation(line: 62, column: 20, scope: !64)
!94 = !DILocation(line: 63, column: 19, scope: !64)
!95 = !DILocation(line: 63, column: 9, scope: !64)
!96 = !DILocation(line: 65, column: 1, scope: !59)
