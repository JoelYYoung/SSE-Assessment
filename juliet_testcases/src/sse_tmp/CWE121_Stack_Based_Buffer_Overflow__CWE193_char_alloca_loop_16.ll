; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_16.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_16_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_16_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 10, align 16, !dbg !21
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %1 = alloca i8, i64 11, align 16, !dbg !24
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !23
  br label %while.body, !dbg !25

while.body:                                       ; preds = %entry
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !26
  store i8* %2, i8** %data, align 8, !dbg !28
  %3 = load i8*, i8** %data, align 8, !dbg !29
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !29
  store i8 0, i8* %arrayidx, align 1, !dbg !30
  br label %while.end, !dbg !31

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !32, metadata !DIExpression()), !dbg !37
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !37
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_16_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !43, metadata !DIExpression()), !dbg !44
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !45
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !46
  store i64 %call, i64* %sourceLen, align 8, !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %while.end
  %5 = load i64, i64* %i, align 8, !dbg !51
  %6 = load i64, i64* %sourceLen, align 8, !dbg !53
  %add = add i64 %6, 1, !dbg !54
  %cmp = icmp ult i64 %5, %add, !dbg !55
  br i1 %cmp, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %7, !dbg !59
  %8 = load i8, i8* %arrayidx1, align 1, !dbg !59
  %9 = load i8*, i8** %data, align 8, !dbg !60
  %10 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !60
  store i8 %8, i8* %arrayidx2, align 1, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !64
  %inc = add i64 %11, 1, !dbg !64
  store i64 %inc, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %data, align 8, !dbg !69
  call void @printLine(i8* %12), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_16_good() #0 !dbg !72 {
entry:
  call void @goodG2B(), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !75 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !80, metadata !DIExpression()), !dbg !81
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i64 @time(i64* null) #7, !dbg !84
  %conv = trunc i64 %call to i32, !dbg !85
  call void @srand(i32 %conv) #7, !dbg !86
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !87
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_16_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_16_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !94 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  %0 = alloca i8, i64 10, align 16, !dbg !99
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %1 = alloca i8, i64 11, align 16, !dbg !102
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !101
  br label %while.body, !dbg !103

while.body:                                       ; preds = %entry
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !104
  store i8* %2, i8** %data, align 8, !dbg !106
  %3 = load i8*, i8** %data, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !107
  store i8 0, i8* %arrayidx, align 1, !dbg !108
  br label %while.end, !dbg !109

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !110, metadata !DIExpression()), !dbg !112
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !112
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !112
  call void @llvm.dbg.declare(metadata i64* %i, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !115, metadata !DIExpression()), !dbg !116
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !117
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !118
  store i64 %call, i64* %sourceLen, align 8, !dbg !119
  store i64 0, i64* %i, align 8, !dbg !120
  br label %for.cond, !dbg !122

for.cond:                                         ; preds = %for.inc, %while.end
  %5 = load i64, i64* %i, align 8, !dbg !123
  %6 = load i64, i64* %sourceLen, align 8, !dbg !125
  %add = add i64 %6, 1, !dbg !126
  %cmp = icmp ult i64 %5, %add, !dbg !127
  br i1 %cmp, label %for.body, label %for.end, !dbg !128

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !129
  %arrayidx1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %7, !dbg !131
  %8 = load i8, i8* %arrayidx1, align 1, !dbg !131
  %9 = load i8*, i8** %data, align 8, !dbg !132
  %10 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !132
  store i8 %8, i8* %arrayidx2, align 1, !dbg !134
  br label %for.inc, !dbg !135

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !136
  %inc = add i64 %11, 1, !dbg !136
  store i64 %inc, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !137, !llvm.loop !138

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %data, align 8, !dbg !140
  call void @printLine(i8* %12), !dbg !141
  ret void, !dbg !142
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_16.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_16_bad", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_16.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 30, type: !4)
!18 = !DILocation(line: 30, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 31, type: !4)
!20 = !DILocation(line: 31, column: 12, scope: !13)
!21 = !DILocation(line: 31, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 32, type: !4)
!23 = !DILocation(line: 32, column: 12, scope: !13)
!24 = !DILocation(line: 32, column: 37, scope: !13)
!25 = !DILocation(line: 33, column: 5, scope: !13)
!26 = !DILocation(line: 37, column: 16, scope: !27)
!27 = distinct !DILexicalBlock(scope: !13, file: !14, line: 34, column: 5)
!28 = !DILocation(line: 37, column: 14, scope: !27)
!29 = !DILocation(line: 38, column: 9, scope: !27)
!30 = !DILocation(line: 38, column: 17, scope: !27)
!31 = !DILocation(line: 39, column: 9, scope: !27)
!32 = !DILocalVariable(name: "source", scope: !33, file: !14, line: 42, type: !34)
!33 = distinct !DILexicalBlock(scope: !13, file: !14, line: 41, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 11)
!37 = !DILocation(line: 42, column: 14, scope: !33)
!38 = !DILocalVariable(name: "i", scope: !33, file: !14, line: 43, type: !39)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 46, baseType: !41)
!40 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!41 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 43, column: 16, scope: !33)
!43 = !DILocalVariable(name: "sourceLen", scope: !33, file: !14, line: 43, type: !39)
!44 = !DILocation(line: 43, column: 19, scope: !33)
!45 = !DILocation(line: 44, column: 28, scope: !33)
!46 = !DILocation(line: 44, column: 21, scope: !33)
!47 = !DILocation(line: 44, column: 19, scope: !33)
!48 = !DILocation(line: 47, column: 16, scope: !49)
!49 = distinct !DILexicalBlock(scope: !33, file: !14, line: 47, column: 9)
!50 = !DILocation(line: 47, column: 14, scope: !49)
!51 = !DILocation(line: 47, column: 21, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !14, line: 47, column: 9)
!53 = !DILocation(line: 47, column: 25, scope: !52)
!54 = !DILocation(line: 47, column: 35, scope: !52)
!55 = !DILocation(line: 47, column: 23, scope: !52)
!56 = !DILocation(line: 47, column: 9, scope: !49)
!57 = !DILocation(line: 49, column: 30, scope: !58)
!58 = distinct !DILexicalBlock(scope: !52, file: !14, line: 48, column: 9)
!59 = !DILocation(line: 49, column: 23, scope: !58)
!60 = !DILocation(line: 49, column: 13, scope: !58)
!61 = !DILocation(line: 49, column: 18, scope: !58)
!62 = !DILocation(line: 49, column: 21, scope: !58)
!63 = !DILocation(line: 50, column: 9, scope: !58)
!64 = !DILocation(line: 47, column: 41, scope: !52)
!65 = !DILocation(line: 47, column: 9, scope: !52)
!66 = distinct !{!66, !56, !67, !68}
!67 = !DILocation(line: 50, column: 9, scope: !49)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocation(line: 51, column: 19, scope: !33)
!70 = !DILocation(line: 51, column: 9, scope: !33)
!71 = !DILocation(line: 53, column: 1, scope: !13)
!72 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_16_good", scope: !14, file: !14, line: 87, type: !15, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocation(line: 89, column: 5, scope: !72)
!74 = !DILocation(line: 90, column: 1, scope: !72)
!75 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 102, type: !76, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!78, !78, !79}
!78 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !14, line: 102, type: !78)
!81 = !DILocation(line: 102, column: 14, scope: !75)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !14, line: 102, type: !79)
!83 = !DILocation(line: 102, column: 27, scope: !75)
!84 = !DILocation(line: 105, column: 22, scope: !75)
!85 = !DILocation(line: 105, column: 12, scope: !75)
!86 = !DILocation(line: 105, column: 5, scope: !75)
!87 = !DILocation(line: 107, column: 5, scope: !75)
!88 = !DILocation(line: 108, column: 5, scope: !75)
!89 = !DILocation(line: 109, column: 5, scope: !75)
!90 = !DILocation(line: 112, column: 5, scope: !75)
!91 = !DILocation(line: 113, column: 5, scope: !75)
!92 = !DILocation(line: 114, column: 5, scope: !75)
!93 = !DILocation(line: 116, column: 5, scope: !75)
!94 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 60, type: !15, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "data", scope: !94, file: !14, line: 62, type: !4)
!96 = !DILocation(line: 62, column: 12, scope: !94)
!97 = !DILocalVariable(name: "dataBadBuffer", scope: !94, file: !14, line: 63, type: !4)
!98 = !DILocation(line: 63, column: 12, scope: !94)
!99 = !DILocation(line: 63, column: 36, scope: !94)
!100 = !DILocalVariable(name: "dataGoodBuffer", scope: !94, file: !14, line: 64, type: !4)
!101 = !DILocation(line: 64, column: 12, scope: !94)
!102 = !DILocation(line: 64, column: 37, scope: !94)
!103 = !DILocation(line: 65, column: 5, scope: !94)
!104 = !DILocation(line: 69, column: 16, scope: !105)
!105 = distinct !DILexicalBlock(scope: !94, file: !14, line: 66, column: 5)
!106 = !DILocation(line: 69, column: 14, scope: !105)
!107 = !DILocation(line: 70, column: 9, scope: !105)
!108 = !DILocation(line: 70, column: 17, scope: !105)
!109 = !DILocation(line: 71, column: 9, scope: !105)
!110 = !DILocalVariable(name: "source", scope: !111, file: !14, line: 74, type: !34)
!111 = distinct !DILexicalBlock(scope: !94, file: !14, line: 73, column: 5)
!112 = !DILocation(line: 74, column: 14, scope: !111)
!113 = !DILocalVariable(name: "i", scope: !111, file: !14, line: 75, type: !39)
!114 = !DILocation(line: 75, column: 16, scope: !111)
!115 = !DILocalVariable(name: "sourceLen", scope: !111, file: !14, line: 75, type: !39)
!116 = !DILocation(line: 75, column: 19, scope: !111)
!117 = !DILocation(line: 76, column: 28, scope: !111)
!118 = !DILocation(line: 76, column: 21, scope: !111)
!119 = !DILocation(line: 76, column: 19, scope: !111)
!120 = !DILocation(line: 79, column: 16, scope: !121)
!121 = distinct !DILexicalBlock(scope: !111, file: !14, line: 79, column: 9)
!122 = !DILocation(line: 79, column: 14, scope: !121)
!123 = !DILocation(line: 79, column: 21, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !14, line: 79, column: 9)
!125 = !DILocation(line: 79, column: 25, scope: !124)
!126 = !DILocation(line: 79, column: 35, scope: !124)
!127 = !DILocation(line: 79, column: 23, scope: !124)
!128 = !DILocation(line: 79, column: 9, scope: !121)
!129 = !DILocation(line: 81, column: 30, scope: !130)
!130 = distinct !DILexicalBlock(scope: !124, file: !14, line: 80, column: 9)
!131 = !DILocation(line: 81, column: 23, scope: !130)
!132 = !DILocation(line: 81, column: 13, scope: !130)
!133 = !DILocation(line: 81, column: 18, scope: !130)
!134 = !DILocation(line: 81, column: 21, scope: !130)
!135 = !DILocation(line: 82, column: 9, scope: !130)
!136 = !DILocation(line: 79, column: 41, scope: !124)
!137 = !DILocation(line: 79, column: 9, scope: !124)
!138 = distinct !{!138, !128, !139, !68}
!139 = !DILocation(line: 82, column: 9, scope: !121)
!140 = !DILocation(line: 83, column: 19, scope: !111)
!141 = !DILocation(line: 83, column: 9, scope: !111)
!142 = !DILocation(line: 85, column: 1, scope: !94)
