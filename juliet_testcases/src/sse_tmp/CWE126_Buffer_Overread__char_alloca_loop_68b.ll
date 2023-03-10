; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_68b.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_68b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE126_Buffer_Overread__char_alloca_loop_68_badData = external dso_local global i8*, align 8
@CWE126_Buffer_Overread__char_alloca_loop_68_goodG2BData = external dso_local global i8*, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_loop_68b_badSink() #0 !dbg !9 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !13, metadata !DIExpression()), !dbg !16
  %0 = load i8*, i8** @CWE126_Buffer_Overread__char_alloca_loop_68_badData, align 8, !dbg !17
  store i8* %0, i8** %data, align 8, !dbg !16
  call void @llvm.dbg.declare(metadata i64* %i, metadata !18, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !31
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !34
  %call = call i64 @strlen(i8* %arraydecay1) #5, !dbg !35
  store i64 %call, i64* %destLen, align 8, !dbg !36
  store i64 0, i64* %i, align 8, !dbg !37
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !40
  %2 = load i64, i64* %destLen, align 8, !dbg !42
  %cmp = icmp ult i64 %1, %2, !dbg !43
  br i1 %cmp, label %for.body, label %for.end, !dbg !44

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !45
  %4 = load i64, i64* %i, align 8, !dbg !47
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !45
  %5 = load i8, i8* %arrayidx2, align 1, !dbg !45
  %6 = load i64, i64* %i, align 8, !dbg !48
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %6, !dbg !49
  store i8 %5, i8* %arrayidx3, align 1, !dbg !50
  br label %for.inc, !dbg !51

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !52
  %inc = add i64 %7, 1, !dbg !52
  store i64 %inc, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !53, !llvm.loop !54

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !57
  store i8 0, i8* %arrayidx4, align 1, !dbg !58
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !59
  call void @printLine(i8* %arraydecay5), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_loop_68b_goodG2BSink() #0 !dbg !62 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !63, metadata !DIExpression()), !dbg !64
  %0 = load i8*, i8** @CWE126_Buffer_Overread__char_alloca_loop_68_goodG2BData, align 8, !dbg !65
  store i8* %0, i8** %data, align 8, !dbg !64
  call void @llvm.dbg.declare(metadata i64* %i, metadata !66, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !71, metadata !DIExpression()), !dbg !72
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !73
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !73
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !74
  store i8 0, i8* %arrayidx, align 1, !dbg !75
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !76
  %call = call i64 @strlen(i8* %arraydecay1) #5, !dbg !77
  store i64 %call, i64* %destLen, align 8, !dbg !78
  store i64 0, i64* %i, align 8, !dbg !79
  br label %for.cond, !dbg !81

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !82
  %2 = load i64, i64* %destLen, align 8, !dbg !84
  %cmp = icmp ult i64 %1, %2, !dbg !85
  br i1 %cmp, label %for.body, label %for.end, !dbg !86

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !87
  %4 = load i64, i64* %i, align 8, !dbg !89
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !87
  %5 = load i8, i8* %arrayidx2, align 1, !dbg !87
  %6 = load i64, i64* %i, align 8, !dbg !90
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %6, !dbg !91
  store i8 %5, i8* %arrayidx3, align 1, !dbg !92
  br label %for.inc, !dbg !93

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !94
  %inc = add i64 %7, 1, !dbg !94
  store i64 %inc, i64* %i, align 8, !dbg !94
  br label %for.cond, !dbg !95, !llvm.loop !96

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !98
  store i8 0, i8* %arrayidx4, align 1, !dbg !99
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !100
  call void @printLine(i8* %arraydecay5), !dbg !101
  ret void, !dbg !102
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_68b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_68b_badSink", scope: !10, file: !10, line: 28, type: !11, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_68b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 30, type: !14)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DILocation(line: 30, column: 12, scope: !9)
!17 = !DILocation(line: 30, column: 19, scope: !9)
!18 = !DILocalVariable(name: "i", scope: !19, file: !10, line: 32, type: !20)
!19 = distinct !DILexicalBlock(scope: !9, file: !10, line: 31, column: 5)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !21, line: 46, baseType: !22)
!21 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!22 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!23 = !DILocation(line: 32, column: 16, scope: !19)
!24 = !DILocalVariable(name: "destLen", scope: !19, file: !10, line: 32, type: !20)
!25 = !DILocation(line: 32, column: 19, scope: !19)
!26 = !DILocalVariable(name: "dest", scope: !19, file: !10, line: 33, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 800, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 33, column: 14, scope: !19)
!31 = !DILocation(line: 34, column: 9, scope: !19)
!32 = !DILocation(line: 35, column: 9, scope: !19)
!33 = !DILocation(line: 35, column: 21, scope: !19)
!34 = !DILocation(line: 36, column: 26, scope: !19)
!35 = !DILocation(line: 36, column: 19, scope: !19)
!36 = !DILocation(line: 36, column: 17, scope: !19)
!37 = !DILocation(line: 39, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !19, file: !10, line: 39, column: 9)
!39 = !DILocation(line: 39, column: 14, scope: !38)
!40 = !DILocation(line: 39, column: 21, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !10, line: 39, column: 9)
!42 = !DILocation(line: 39, column: 25, scope: !41)
!43 = !DILocation(line: 39, column: 23, scope: !41)
!44 = !DILocation(line: 39, column: 9, scope: !38)
!45 = !DILocation(line: 41, column: 23, scope: !46)
!46 = distinct !DILexicalBlock(scope: !41, file: !10, line: 40, column: 9)
!47 = !DILocation(line: 41, column: 28, scope: !46)
!48 = !DILocation(line: 41, column: 18, scope: !46)
!49 = !DILocation(line: 41, column: 13, scope: !46)
!50 = !DILocation(line: 41, column: 21, scope: !46)
!51 = !DILocation(line: 42, column: 9, scope: !46)
!52 = !DILocation(line: 39, column: 35, scope: !41)
!53 = !DILocation(line: 39, column: 9, scope: !41)
!54 = distinct !{!54, !44, !55, !56}
!55 = !DILocation(line: 42, column: 9, scope: !38)
!56 = !{!"llvm.loop.mustprogress"}
!57 = !DILocation(line: 43, column: 9, scope: !19)
!58 = !DILocation(line: 43, column: 21, scope: !19)
!59 = !DILocation(line: 44, column: 19, scope: !19)
!60 = !DILocation(line: 44, column: 9, scope: !19)
!61 = !DILocation(line: 46, column: 1, scope: !9)
!62 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_68b_goodG2BSink", scope: !10, file: !10, line: 53, type: !11, scopeLine: 54, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocalVariable(name: "data", scope: !62, file: !10, line: 55, type: !14)
!64 = !DILocation(line: 55, column: 12, scope: !62)
!65 = !DILocation(line: 55, column: 19, scope: !62)
!66 = !DILocalVariable(name: "i", scope: !67, file: !10, line: 57, type: !20)
!67 = distinct !DILexicalBlock(scope: !62, file: !10, line: 56, column: 5)
!68 = !DILocation(line: 57, column: 16, scope: !67)
!69 = !DILocalVariable(name: "destLen", scope: !67, file: !10, line: 57, type: !20)
!70 = !DILocation(line: 57, column: 19, scope: !67)
!71 = !DILocalVariable(name: "dest", scope: !67, file: !10, line: 58, type: !27)
!72 = !DILocation(line: 58, column: 14, scope: !67)
!73 = !DILocation(line: 59, column: 9, scope: !67)
!74 = !DILocation(line: 60, column: 9, scope: !67)
!75 = !DILocation(line: 60, column: 21, scope: !67)
!76 = !DILocation(line: 61, column: 26, scope: !67)
!77 = !DILocation(line: 61, column: 19, scope: !67)
!78 = !DILocation(line: 61, column: 17, scope: !67)
!79 = !DILocation(line: 64, column: 16, scope: !80)
!80 = distinct !DILexicalBlock(scope: !67, file: !10, line: 64, column: 9)
!81 = !DILocation(line: 64, column: 14, scope: !80)
!82 = !DILocation(line: 64, column: 21, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !10, line: 64, column: 9)
!84 = !DILocation(line: 64, column: 25, scope: !83)
!85 = !DILocation(line: 64, column: 23, scope: !83)
!86 = !DILocation(line: 64, column: 9, scope: !80)
!87 = !DILocation(line: 66, column: 23, scope: !88)
!88 = distinct !DILexicalBlock(scope: !83, file: !10, line: 65, column: 9)
!89 = !DILocation(line: 66, column: 28, scope: !88)
!90 = !DILocation(line: 66, column: 18, scope: !88)
!91 = !DILocation(line: 66, column: 13, scope: !88)
!92 = !DILocation(line: 66, column: 21, scope: !88)
!93 = !DILocation(line: 67, column: 9, scope: !88)
!94 = !DILocation(line: 64, column: 35, scope: !83)
!95 = !DILocation(line: 64, column: 9, scope: !83)
!96 = distinct !{!96, !86, !97, !56}
!97 = !DILocation(line: 67, column: 9, scope: !80)
!98 = !DILocation(line: 68, column: 9, scope: !67)
!99 = !DILocation(line: 68, column: 21, scope: !67)
!100 = !DILocation(line: 69, column: 19, scope: !67)
!101 = !DILocation(line: 69, column: 9, scope: !67)
!102 = !DILocation(line: 71, column: 1, scope: !62)
