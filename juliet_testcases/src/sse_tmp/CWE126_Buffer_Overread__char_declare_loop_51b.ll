; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_51b.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_51b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_51b_badSink(i8* %data) #0 !dbg !9 {
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
  %call = call i64 @strlen(i8* %arraydecay1) #5, !dbg !34
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
  ret void, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_51b_goodG2BSink(i8* %data) #0 !dbg !61 {
entry:
  %data.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata i64* %i, metadata !64, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !67, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !69, metadata !DIExpression()), !dbg !70
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !71
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !71
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !72
  store i8 0, i8* %arrayidx, align 1, !dbg !73
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !74
  %call = call i64 @strlen(i8* %arraydecay1) #5, !dbg !75
  store i64 %call, i64* %destLen, align 8, !dbg !76
  store i64 0, i64* %i, align 8, !dbg !77
  br label %for.cond, !dbg !79

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !80
  %1 = load i64, i64* %destLen, align 8, !dbg !82
  %cmp = icmp ult i64 %0, %1, !dbg !83
  br i1 %cmp, label %for.body, label %for.end, !dbg !84

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data.addr, align 8, !dbg !85
  %3 = load i64, i64* %i, align 8, !dbg !87
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !85
  %4 = load i8, i8* %arrayidx2, align 1, !dbg !85
  %5 = load i64, i64* %i, align 8, !dbg !88
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !89
  store i8 %4, i8* %arrayidx3, align 1, !dbg !90
  br label %for.inc, !dbg !91

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !92
  %inc = add i64 %6, 1, !dbg !92
  store i64 %inc, i64* %i, align 8, !dbg !92
  br label %for.cond, !dbg !93, !llvm.loop !94

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !96
  store i8 0, i8* %arrayidx4, align 1, !dbg !97
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !98
  call void @printLine(i8* %arraydecay5), !dbg !99
  ret void, !dbg !100
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_51b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_51b_badSink", scope: !10, file: !10, line: 25, type: !11, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_51b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!15 = !DILocalVariable(name: "data", arg: 1, scope: !9, file: !10, line: 25, type: !13)
!16 = !DILocation(line: 25, column: 67, scope: !9)
!17 = !DILocalVariable(name: "i", scope: !18, file: !10, line: 28, type: !19)
!18 = distinct !DILexicalBlock(scope: !9, file: !10, line: 27, column: 5)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !20, line: 46, baseType: !21)
!20 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!21 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!22 = !DILocation(line: 28, column: 16, scope: !18)
!23 = !DILocalVariable(name: "destLen", scope: !18, file: !10, line: 28, type: !19)
!24 = !DILocation(line: 28, column: 19, scope: !18)
!25 = !DILocalVariable(name: "dest", scope: !18, file: !10, line: 29, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 800, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 29, column: 14, scope: !18)
!30 = !DILocation(line: 30, column: 9, scope: !18)
!31 = !DILocation(line: 31, column: 9, scope: !18)
!32 = !DILocation(line: 31, column: 21, scope: !18)
!33 = !DILocation(line: 32, column: 26, scope: !18)
!34 = !DILocation(line: 32, column: 19, scope: !18)
!35 = !DILocation(line: 32, column: 17, scope: !18)
!36 = !DILocation(line: 35, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !18, file: !10, line: 35, column: 9)
!38 = !DILocation(line: 35, column: 14, scope: !37)
!39 = !DILocation(line: 35, column: 21, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !10, line: 35, column: 9)
!41 = !DILocation(line: 35, column: 25, scope: !40)
!42 = !DILocation(line: 35, column: 23, scope: !40)
!43 = !DILocation(line: 35, column: 9, scope: !37)
!44 = !DILocation(line: 37, column: 23, scope: !45)
!45 = distinct !DILexicalBlock(scope: !40, file: !10, line: 36, column: 9)
!46 = !DILocation(line: 37, column: 28, scope: !45)
!47 = !DILocation(line: 37, column: 18, scope: !45)
!48 = !DILocation(line: 37, column: 13, scope: !45)
!49 = !DILocation(line: 37, column: 21, scope: !45)
!50 = !DILocation(line: 38, column: 9, scope: !45)
!51 = !DILocation(line: 35, column: 35, scope: !40)
!52 = !DILocation(line: 35, column: 9, scope: !40)
!53 = distinct !{!53, !43, !54, !55}
!54 = !DILocation(line: 38, column: 9, scope: !37)
!55 = !{!"llvm.loop.mustprogress"}
!56 = !DILocation(line: 39, column: 9, scope: !18)
!57 = !DILocation(line: 39, column: 21, scope: !18)
!58 = !DILocation(line: 40, column: 19, scope: !18)
!59 = !DILocation(line: 40, column: 9, scope: !18)
!60 = !DILocation(line: 42, column: 1, scope: !9)
!61 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_51b_goodG2BSink", scope: !10, file: !10, line: 49, type: !11, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocalVariable(name: "data", arg: 1, scope: !61, file: !10, line: 49, type: !13)
!63 = !DILocation(line: 49, column: 71, scope: !61)
!64 = !DILocalVariable(name: "i", scope: !65, file: !10, line: 52, type: !19)
!65 = distinct !DILexicalBlock(scope: !61, file: !10, line: 51, column: 5)
!66 = !DILocation(line: 52, column: 16, scope: !65)
!67 = !DILocalVariable(name: "destLen", scope: !65, file: !10, line: 52, type: !19)
!68 = !DILocation(line: 52, column: 19, scope: !65)
!69 = !DILocalVariable(name: "dest", scope: !65, file: !10, line: 53, type: !26)
!70 = !DILocation(line: 53, column: 14, scope: !65)
!71 = !DILocation(line: 54, column: 9, scope: !65)
!72 = !DILocation(line: 55, column: 9, scope: !65)
!73 = !DILocation(line: 55, column: 21, scope: !65)
!74 = !DILocation(line: 56, column: 26, scope: !65)
!75 = !DILocation(line: 56, column: 19, scope: !65)
!76 = !DILocation(line: 56, column: 17, scope: !65)
!77 = !DILocation(line: 59, column: 16, scope: !78)
!78 = distinct !DILexicalBlock(scope: !65, file: !10, line: 59, column: 9)
!79 = !DILocation(line: 59, column: 14, scope: !78)
!80 = !DILocation(line: 59, column: 21, scope: !81)
!81 = distinct !DILexicalBlock(scope: !78, file: !10, line: 59, column: 9)
!82 = !DILocation(line: 59, column: 25, scope: !81)
!83 = !DILocation(line: 59, column: 23, scope: !81)
!84 = !DILocation(line: 59, column: 9, scope: !78)
!85 = !DILocation(line: 61, column: 23, scope: !86)
!86 = distinct !DILexicalBlock(scope: !81, file: !10, line: 60, column: 9)
!87 = !DILocation(line: 61, column: 28, scope: !86)
!88 = !DILocation(line: 61, column: 18, scope: !86)
!89 = !DILocation(line: 61, column: 13, scope: !86)
!90 = !DILocation(line: 61, column: 21, scope: !86)
!91 = !DILocation(line: 62, column: 9, scope: !86)
!92 = !DILocation(line: 59, column: 35, scope: !81)
!93 = !DILocation(line: 59, column: 9, scope: !81)
!94 = distinct !{!94, !84, !95, !55}
!95 = !DILocation(line: 62, column: 9, scope: !78)
!96 = !DILocation(line: 63, column: 9, scope: !65)
!97 = !DILocation(line: 63, column: 21, scope: !65)
!98 = !DILocation(line: 64, column: 19, scope: !65)
!99 = !DILocation(line: 64, column: 9, scope: !65)
!100 = !DILocation(line: 66, column: 1, scope: !61)
