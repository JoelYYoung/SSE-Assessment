; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_10.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalTrue = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external dso_local global i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_10_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !17, metadata !DIExpression()), !dbg !18
  store i32* null, i32** %data, align 8, !dbg !19
  %0 = load i32, i32* @globalTrue, align 4, !dbg !20
  %tobool = icmp ne i32 %0, 0, !dbg !20
  br i1 %tobool, label %if.then, label %if.end, !dbg !22

if.then:                                          ; preds = %entry
  %1 = alloca i8, i64 10, align 16, !dbg !23
  %2 = bitcast i8* %1 to i32*, !dbg !25
  store i32* %2, i32** %data, align 8, !dbg !26
  br label %if.end, !dbg !27

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !28, metadata !DIExpression()), !dbg !33
  %3 = bitcast [10 x i32]* %source to i8*, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !33
  call void @llvm.dbg.declare(metadata i64* %i, metadata !34, metadata !DIExpression()), !dbg !38
  store i64 0, i64* %i, align 8, !dbg !39
  br label %for.cond, !dbg !41

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !42
  %cmp = icmp ult i64 %4, 10, !dbg !44
  br i1 %cmp, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !46
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %5, !dbg !48
  %6 = load i32, i32* %arrayidx, align 4, !dbg !48
  %7 = load i32*, i32** %data, align 8, !dbg !49
  %8 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx1 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !49
  store i32 %6, i32* %arrayidx1, align 4, !dbg !51
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !53
  %inc = add i64 %9, 1, !dbg !53
  store i64 %inc, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !58
  %arrayidx2 = getelementptr inbounds i32, i32* %10, i64 0, !dbg !58
  %11 = load i32, i32* %arrayidx2, align 4, !dbg !58
  call void @printIntLine(i32 %11), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_10_good() #0 !dbg !61 {
entry:
  call void @goodG2B1(), !dbg !62
  call void @goodG2B2(), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !65 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !71, metadata !DIExpression()), !dbg !72
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !73, metadata !DIExpression()), !dbg !74
  %call = call i64 @time(i64* null) #5, !dbg !75
  %conv = trunc i64 %call to i32, !dbg !76
  call void @srand(i32 %conv) #5, !dbg !77
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_10_good(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_10_bad(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !85 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !86, metadata !DIExpression()), !dbg !87
  store i32* null, i32** %data, align 8, !dbg !88
  %0 = load i32, i32* @globalFalse, align 4, !dbg !89
  %tobool = icmp ne i32 %0, 0, !dbg !89
  br i1 %tobool, label %if.then, label %if.else, !dbg !91

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !92
  br label %if.end, !dbg !94

if.else:                                          ; preds = %entry
  %1 = alloca i8, i64 40, align 16, !dbg !95
  %2 = bitcast i8* %1 to i32*, !dbg !97
  store i32* %2, i32** %data, align 8, !dbg !98
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !99, metadata !DIExpression()), !dbg !101
  %3 = bitcast [10 x i32]* %source to i8*, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !101
  call void @llvm.dbg.declare(metadata i64* %i, metadata !102, metadata !DIExpression()), !dbg !103
  store i64 0, i64* %i, align 8, !dbg !104
  br label %for.cond, !dbg !106

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !107
  %cmp = icmp ult i64 %4, 10, !dbg !109
  br i1 %cmp, label %for.body, label %for.end, !dbg !110

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !111
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %5, !dbg !113
  %6 = load i32, i32* %arrayidx, align 4, !dbg !113
  %7 = load i32*, i32** %data, align 8, !dbg !114
  %8 = load i64, i64* %i, align 8, !dbg !115
  %arrayidx1 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !114
  store i32 %6, i32* %arrayidx1, align 4, !dbg !116
  br label %for.inc, !dbg !117

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !118
  %inc = add i64 %9, 1, !dbg !118
  store i64 %inc, i64* %i, align 8, !dbg !118
  br label %for.cond, !dbg !119, !llvm.loop !120

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !122
  %arrayidx2 = getelementptr inbounds i32, i32* %10, i64 0, !dbg !122
  %11 = load i32, i32* %arrayidx2, align 4, !dbg !122
  call void @printIntLine(i32 %11), !dbg !123
  ret void, !dbg !124
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !125 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !126, metadata !DIExpression()), !dbg !127
  store i32* null, i32** %data, align 8, !dbg !128
  %0 = load i32, i32* @globalTrue, align 4, !dbg !129
  %tobool = icmp ne i32 %0, 0, !dbg !129
  br i1 %tobool, label %if.then, label %if.end, !dbg !131

if.then:                                          ; preds = %entry
  %1 = alloca i8, i64 40, align 16, !dbg !132
  %2 = bitcast i8* %1 to i32*, !dbg !134
  store i32* %2, i32** %data, align 8, !dbg !135
  br label %if.end, !dbg !136

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !137, metadata !DIExpression()), !dbg !139
  %3 = bitcast [10 x i32]* %source to i8*, !dbg !139
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !139
  call void @llvm.dbg.declare(metadata i64* %i, metadata !140, metadata !DIExpression()), !dbg !141
  store i64 0, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !144

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !145
  %cmp = icmp ult i64 %4, 10, !dbg !147
  br i1 %cmp, label %for.body, label %for.end, !dbg !148

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !149
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %5, !dbg !151
  %6 = load i32, i32* %arrayidx, align 4, !dbg !151
  %7 = load i32*, i32** %data, align 8, !dbg !152
  %8 = load i64, i64* %i, align 8, !dbg !153
  %arrayidx1 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !152
  store i32 %6, i32* %arrayidx1, align 4, !dbg !154
  br label %for.inc, !dbg !155

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !156
  %inc = add i64 %9, 1, !dbg !156
  store i64 %inc, i64* %i, align 8, !dbg !156
  br label %for.cond, !dbg !157, !llvm.loop !158

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !160
  %arrayidx2 = getelementptr inbounds i32, i32* %10, i64 0, !dbg !160
  %11 = load i32, i32* %arrayidx2, align 4, !dbg !160
  call void @printIntLine(i32 %11), !dbg !161
  ret void, !dbg !162
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_10.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_10_bad", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_10.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 23, type: !4)
!18 = !DILocation(line: 23, column: 11, scope: !13)
!19 = !DILocation(line: 24, column: 10, scope: !13)
!20 = !DILocation(line: 25, column: 8, scope: !21)
!21 = distinct !DILexicalBlock(scope: !13, file: !14, line: 25, column: 8)
!22 = !DILocation(line: 25, column: 8, scope: !13)
!23 = !DILocation(line: 28, column: 23, scope: !24)
!24 = distinct !DILexicalBlock(scope: !21, file: !14, line: 26, column: 5)
!25 = !DILocation(line: 28, column: 16, scope: !24)
!26 = !DILocation(line: 28, column: 14, scope: !24)
!27 = !DILocation(line: 29, column: 5, scope: !24)
!28 = !DILocalVariable(name: "source", scope: !29, file: !14, line: 31, type: !30)
!29 = distinct !DILexicalBlock(scope: !13, file: !14, line: 30, column: 5)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 10)
!33 = !DILocation(line: 31, column: 13, scope: !29)
!34 = !DILocalVariable(name: "i", scope: !29, file: !14, line: 32, type: !35)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !36, line: 46, baseType: !37)
!36 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!37 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!38 = !DILocation(line: 32, column: 16, scope: !29)
!39 = !DILocation(line: 34, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !29, file: !14, line: 34, column: 9)
!41 = !DILocation(line: 34, column: 14, scope: !40)
!42 = !DILocation(line: 34, column: 21, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !14, line: 34, column: 9)
!44 = !DILocation(line: 34, column: 23, scope: !43)
!45 = !DILocation(line: 34, column: 9, scope: !40)
!46 = !DILocation(line: 36, column: 30, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !14, line: 35, column: 9)
!48 = !DILocation(line: 36, column: 23, scope: !47)
!49 = !DILocation(line: 36, column: 13, scope: !47)
!50 = !DILocation(line: 36, column: 18, scope: !47)
!51 = !DILocation(line: 36, column: 21, scope: !47)
!52 = !DILocation(line: 37, column: 9, scope: !47)
!53 = !DILocation(line: 34, column: 30, scope: !43)
!54 = !DILocation(line: 34, column: 9, scope: !43)
!55 = distinct !{!55, !45, !56, !57}
!56 = !DILocation(line: 37, column: 9, scope: !40)
!57 = !{!"llvm.loop.mustprogress"}
!58 = !DILocation(line: 38, column: 22, scope: !29)
!59 = !DILocation(line: 38, column: 9, scope: !29)
!60 = !DILocation(line: 40, column: 1, scope: !13)
!61 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_10_good", scope: !14, file: !14, line: 95, type: !15, scopeLine: 96, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocation(line: 97, column: 5, scope: !61)
!63 = !DILocation(line: 98, column: 5, scope: !61)
!64 = !DILocation(line: 99, column: 1, scope: !61)
!65 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 111, type: !66, scopeLine: 112, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{!5, !5, !68}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !14, line: 111, type: !5)
!72 = !DILocation(line: 111, column: 14, scope: !65)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !14, line: 111, type: !68)
!74 = !DILocation(line: 111, column: 27, scope: !65)
!75 = !DILocation(line: 114, column: 22, scope: !65)
!76 = !DILocation(line: 114, column: 12, scope: !65)
!77 = !DILocation(line: 114, column: 5, scope: !65)
!78 = !DILocation(line: 116, column: 5, scope: !65)
!79 = !DILocation(line: 117, column: 5, scope: !65)
!80 = !DILocation(line: 118, column: 5, scope: !65)
!81 = !DILocation(line: 121, column: 5, scope: !65)
!82 = !DILocation(line: 122, column: 5, scope: !65)
!83 = !DILocation(line: 123, column: 5, scope: !65)
!84 = !DILocation(line: 125, column: 5, scope: !65)
!85 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 47, type: !15, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "data", scope: !85, file: !14, line: 49, type: !4)
!87 = !DILocation(line: 49, column: 11, scope: !85)
!88 = !DILocation(line: 50, column: 10, scope: !85)
!89 = !DILocation(line: 51, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !85, file: !14, line: 51, column: 8)
!91 = !DILocation(line: 51, column: 8, scope: !85)
!92 = !DILocation(line: 54, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !14, line: 52, column: 5)
!94 = !DILocation(line: 55, column: 5, scope: !93)
!95 = !DILocation(line: 59, column: 23, scope: !96)
!96 = distinct !DILexicalBlock(scope: !90, file: !14, line: 57, column: 5)
!97 = !DILocation(line: 59, column: 16, scope: !96)
!98 = !DILocation(line: 59, column: 14, scope: !96)
!99 = !DILocalVariable(name: "source", scope: !100, file: !14, line: 62, type: !30)
!100 = distinct !DILexicalBlock(scope: !85, file: !14, line: 61, column: 5)
!101 = !DILocation(line: 62, column: 13, scope: !100)
!102 = !DILocalVariable(name: "i", scope: !100, file: !14, line: 63, type: !35)
!103 = !DILocation(line: 63, column: 16, scope: !100)
!104 = !DILocation(line: 65, column: 16, scope: !105)
!105 = distinct !DILexicalBlock(scope: !100, file: !14, line: 65, column: 9)
!106 = !DILocation(line: 65, column: 14, scope: !105)
!107 = !DILocation(line: 65, column: 21, scope: !108)
!108 = distinct !DILexicalBlock(scope: !105, file: !14, line: 65, column: 9)
!109 = !DILocation(line: 65, column: 23, scope: !108)
!110 = !DILocation(line: 65, column: 9, scope: !105)
!111 = !DILocation(line: 67, column: 30, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !14, line: 66, column: 9)
!113 = !DILocation(line: 67, column: 23, scope: !112)
!114 = !DILocation(line: 67, column: 13, scope: !112)
!115 = !DILocation(line: 67, column: 18, scope: !112)
!116 = !DILocation(line: 67, column: 21, scope: !112)
!117 = !DILocation(line: 68, column: 9, scope: !112)
!118 = !DILocation(line: 65, column: 30, scope: !108)
!119 = !DILocation(line: 65, column: 9, scope: !108)
!120 = distinct !{!120, !110, !121, !57}
!121 = !DILocation(line: 68, column: 9, scope: !105)
!122 = !DILocation(line: 69, column: 22, scope: !100)
!123 = !DILocation(line: 69, column: 9, scope: !100)
!124 = !DILocation(line: 71, column: 1, scope: !85)
!125 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 74, type: !15, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!126 = !DILocalVariable(name: "data", scope: !125, file: !14, line: 76, type: !4)
!127 = !DILocation(line: 76, column: 11, scope: !125)
!128 = !DILocation(line: 77, column: 10, scope: !125)
!129 = !DILocation(line: 78, column: 8, scope: !130)
!130 = distinct !DILexicalBlock(scope: !125, file: !14, line: 78, column: 8)
!131 = !DILocation(line: 78, column: 8, scope: !125)
!132 = !DILocation(line: 81, column: 23, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !14, line: 79, column: 5)
!134 = !DILocation(line: 81, column: 16, scope: !133)
!135 = !DILocation(line: 81, column: 14, scope: !133)
!136 = !DILocation(line: 82, column: 5, scope: !133)
!137 = !DILocalVariable(name: "source", scope: !138, file: !14, line: 84, type: !30)
!138 = distinct !DILexicalBlock(scope: !125, file: !14, line: 83, column: 5)
!139 = !DILocation(line: 84, column: 13, scope: !138)
!140 = !DILocalVariable(name: "i", scope: !138, file: !14, line: 85, type: !35)
!141 = !DILocation(line: 85, column: 16, scope: !138)
!142 = !DILocation(line: 87, column: 16, scope: !143)
!143 = distinct !DILexicalBlock(scope: !138, file: !14, line: 87, column: 9)
!144 = !DILocation(line: 87, column: 14, scope: !143)
!145 = !DILocation(line: 87, column: 21, scope: !146)
!146 = distinct !DILexicalBlock(scope: !143, file: !14, line: 87, column: 9)
!147 = !DILocation(line: 87, column: 23, scope: !146)
!148 = !DILocation(line: 87, column: 9, scope: !143)
!149 = !DILocation(line: 89, column: 30, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !14, line: 88, column: 9)
!151 = !DILocation(line: 89, column: 23, scope: !150)
!152 = !DILocation(line: 89, column: 13, scope: !150)
!153 = !DILocation(line: 89, column: 18, scope: !150)
!154 = !DILocation(line: 89, column: 21, scope: !150)
!155 = !DILocation(line: 90, column: 9, scope: !150)
!156 = !DILocation(line: 87, column: 30, scope: !146)
!157 = !DILocation(line: 87, column: 9, scope: !146)
!158 = distinct !{!158, !148, !159, !57}
!159 = !DILocation(line: 90, column: 9, scope: !143)
!160 = !DILocation(line: 91, column: 22, scope: !138)
!161 = !DILocation(line: 91, column: 9, scope: !138)
!162 = !DILocation(line: 93, column: 1, scope: !125)
