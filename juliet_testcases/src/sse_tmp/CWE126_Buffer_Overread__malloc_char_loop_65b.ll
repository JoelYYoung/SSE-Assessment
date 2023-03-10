; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_65b.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_65b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_65b_badSink(i8* %data) #0 !dbg !9 {
entry:
  %data.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i64* %i, metadata !17, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !25, metadata !DIExpression()), !dbg !29
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !30
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !33
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !34
  store i64 %call, i64* %destLen, align 8, !dbg !35
  store i64 0, i64* %i, align 8, !dbg !36
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !39
  %1 = load i64, i64* %destLen, align 8, !dbg !41
  %cmp = icmp ult i64 %0, %1, !dbg !42
  br i1 %cmp, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data.addr, align 8, !dbg !44
  %3 = load i64, i64* %i, align 8, !dbg !46
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !44
  %4 = load i8, i8* %arrayidx2, align 1, !dbg !44
  %5 = load i64, i64* %i, align 8, !dbg !47
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !48
  store i8 %4, i8* %arrayidx3, align 1, !dbg !49
  br label %for.inc, !dbg !50

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !51
  %inc = add i64 %6, 1, !dbg !51
  store i64 %inc, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !52, !llvm.loop !53

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !56
  store i8 0, i8* %arrayidx4, align 1, !dbg !57
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !58
  call void @printLine(i8* %arraydecay5), !dbg !59
  %7 = load i8*, i8** %data.addr, align 8, !dbg !60
  call void @free(i8* %7) #7, !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_65b_goodG2BSink(i8* %data) #0 !dbg !63 {
entry:
  %data.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata i64* %i, metadata !66, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !71, metadata !DIExpression()), !dbg !72
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !73
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !73
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !74
  store i8 0, i8* %arrayidx, align 1, !dbg !75
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !76
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !77
  store i64 %call, i64* %destLen, align 8, !dbg !78
  store i64 0, i64* %i, align 8, !dbg !79
  br label %for.cond, !dbg !81

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !82
  %1 = load i64, i64* %destLen, align 8, !dbg !84
  %cmp = icmp ult i64 %0, %1, !dbg !85
  br i1 %cmp, label %for.body, label %for.end, !dbg !86

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data.addr, align 8, !dbg !87
  %3 = load i64, i64* %i, align 8, !dbg !89
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !87
  %4 = load i8, i8* %arrayidx2, align 1, !dbg !87
  %5 = load i64, i64* %i, align 8, !dbg !90
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !91
  store i8 %4, i8* %arrayidx3, align 1, !dbg !92
  br label %for.inc, !dbg !93

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !94
  %inc = add i64 %6, 1, !dbg !94
  store i64 %inc, i64* %i, align 8, !dbg !94
  br label %for.cond, !dbg !95, !llvm.loop !96

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !98
  store i8 0, i8* %arrayidx4, align 1, !dbg !99
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !100
  call void @printLine(i8* %arraydecay5), !dbg !101
  %7 = load i8*, i8** %data.addr, align 8, !dbg !102
  call void @free(i8* %7) #7, !dbg !103
  ret void, !dbg !104
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_65b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_65b_badSink", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_65b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!15 = !DILocalVariable(name: "data", arg: 1, scope: !9, file: !10, line: 23, type: !13)
!16 = !DILocation(line: 23, column: 66, scope: !9)
!17 = !DILocalVariable(name: "i", scope: !18, file: !10, line: 26, type: !19)
!18 = distinct !DILexicalBlock(scope: !9, file: !10, line: 25, column: 5)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !20, line: 46, baseType: !21)
!20 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!21 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!22 = !DILocation(line: 26, column: 16, scope: !18)
!23 = !DILocalVariable(name: "destLen", scope: !18, file: !10, line: 26, type: !19)
!24 = !DILocation(line: 26, column: 19, scope: !18)
!25 = !DILocalVariable(name: "dest", scope: !18, file: !10, line: 27, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 800, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 27, column: 14, scope: !18)
!30 = !DILocation(line: 28, column: 9, scope: !18)
!31 = !DILocation(line: 29, column: 9, scope: !18)
!32 = !DILocation(line: 29, column: 21, scope: !18)
!33 = !DILocation(line: 30, column: 26, scope: !18)
!34 = !DILocation(line: 30, column: 19, scope: !18)
!35 = !DILocation(line: 30, column: 17, scope: !18)
!36 = !DILocation(line: 33, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !18, file: !10, line: 33, column: 9)
!38 = !DILocation(line: 33, column: 14, scope: !37)
!39 = !DILocation(line: 33, column: 21, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !10, line: 33, column: 9)
!41 = !DILocation(line: 33, column: 25, scope: !40)
!42 = !DILocation(line: 33, column: 23, scope: !40)
!43 = !DILocation(line: 33, column: 9, scope: !37)
!44 = !DILocation(line: 35, column: 23, scope: !45)
!45 = distinct !DILexicalBlock(scope: !40, file: !10, line: 34, column: 9)
!46 = !DILocation(line: 35, column: 28, scope: !45)
!47 = !DILocation(line: 35, column: 18, scope: !45)
!48 = !DILocation(line: 35, column: 13, scope: !45)
!49 = !DILocation(line: 35, column: 21, scope: !45)
!50 = !DILocation(line: 36, column: 9, scope: !45)
!51 = !DILocation(line: 33, column: 35, scope: !40)
!52 = !DILocation(line: 33, column: 9, scope: !40)
!53 = distinct !{!53, !43, !54, !55}
!54 = !DILocation(line: 36, column: 9, scope: !37)
!55 = !{!"llvm.loop.mustprogress"}
!56 = !DILocation(line: 37, column: 9, scope: !18)
!57 = !DILocation(line: 37, column: 21, scope: !18)
!58 = !DILocation(line: 38, column: 19, scope: !18)
!59 = !DILocation(line: 38, column: 9, scope: !18)
!60 = !DILocation(line: 39, column: 14, scope: !18)
!61 = !DILocation(line: 39, column: 9, scope: !18)
!62 = !DILocation(line: 41, column: 1, scope: !9)
!63 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_65b_goodG2BSink", scope: !10, file: !10, line: 48, type: !11, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocalVariable(name: "data", arg: 1, scope: !63, file: !10, line: 48, type: !13)
!65 = !DILocation(line: 48, column: 70, scope: !63)
!66 = !DILocalVariable(name: "i", scope: !67, file: !10, line: 51, type: !19)
!67 = distinct !DILexicalBlock(scope: !63, file: !10, line: 50, column: 5)
!68 = !DILocation(line: 51, column: 16, scope: !67)
!69 = !DILocalVariable(name: "destLen", scope: !67, file: !10, line: 51, type: !19)
!70 = !DILocation(line: 51, column: 19, scope: !67)
!71 = !DILocalVariable(name: "dest", scope: !67, file: !10, line: 52, type: !26)
!72 = !DILocation(line: 52, column: 14, scope: !67)
!73 = !DILocation(line: 53, column: 9, scope: !67)
!74 = !DILocation(line: 54, column: 9, scope: !67)
!75 = !DILocation(line: 54, column: 21, scope: !67)
!76 = !DILocation(line: 55, column: 26, scope: !67)
!77 = !DILocation(line: 55, column: 19, scope: !67)
!78 = !DILocation(line: 55, column: 17, scope: !67)
!79 = !DILocation(line: 58, column: 16, scope: !80)
!80 = distinct !DILexicalBlock(scope: !67, file: !10, line: 58, column: 9)
!81 = !DILocation(line: 58, column: 14, scope: !80)
!82 = !DILocation(line: 58, column: 21, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !10, line: 58, column: 9)
!84 = !DILocation(line: 58, column: 25, scope: !83)
!85 = !DILocation(line: 58, column: 23, scope: !83)
!86 = !DILocation(line: 58, column: 9, scope: !80)
!87 = !DILocation(line: 60, column: 23, scope: !88)
!88 = distinct !DILexicalBlock(scope: !83, file: !10, line: 59, column: 9)
!89 = !DILocation(line: 60, column: 28, scope: !88)
!90 = !DILocation(line: 60, column: 18, scope: !88)
!91 = !DILocation(line: 60, column: 13, scope: !88)
!92 = !DILocation(line: 60, column: 21, scope: !88)
!93 = !DILocation(line: 61, column: 9, scope: !88)
!94 = !DILocation(line: 58, column: 35, scope: !83)
!95 = !DILocation(line: 58, column: 9, scope: !83)
!96 = distinct !{!96, !86, !97, !55}
!97 = !DILocation(line: 61, column: 9, scope: !80)
!98 = !DILocation(line: 62, column: 9, scope: !67)
!99 = !DILocation(line: 62, column: 21, scope: !67)
!100 = !DILocation(line: 63, column: 19, scope: !67)
!101 = !DILocation(line: 63, column: 9, scope: !67)
!102 = !DILocation(line: 64, column: 14, scope: !67)
!103 = !DILocation(line: 64, column: 9, scope: !67)
!104 = !DILocation(line: 66, column: 1, scope: !63)
