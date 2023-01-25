; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_08_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !17, metadata !DIExpression()), !dbg !18
  store i32* null, i32** %data, align 8, !dbg !19
  %call = call i32 @staticReturnsTrue(), !dbg !20
  %tobool = icmp ne i32 %call, 0, !dbg !20
  br i1 %tobool, label %if.then, label %if.end, !dbg !22

if.then:                                          ; preds = %entry
  %0 = alloca i8, i64 10, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !25
  store i32* %1, i32** %data, align 8, !dbg !26
  br label %if.end, !dbg !27

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !28, metadata !DIExpression()), !dbg !33
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !33
  call void @llvm.dbg.declare(metadata i64* %i, metadata !34, metadata !DIExpression()), !dbg !38
  store i64 0, i64* %i, align 8, !dbg !39
  br label %for.cond, !dbg !41

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !42
  %cmp = icmp ult i64 %3, 10, !dbg !44
  br i1 %cmp, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !46
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %4, !dbg !48
  %5 = load i32, i32* %arrayidx, align 4, !dbg !48
  %6 = load i32*, i32** %data, align 8, !dbg !49
  %7 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx1 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !49
  store i32 %5, i32* %arrayidx1, align 4, !dbg !51
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !53
  %inc = add i64 %8, 1, !dbg !53
  store i64 %inc, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !58
  %arrayidx2 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !58
  %10 = load i32, i32* %arrayidx2, align 4, !dbg !58
  call void @printIntLine(i32 %10), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_08_good() #0 !dbg !61 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_08_good(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_08_bad(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !85 {
entry:
  ret i32 1, !dbg !88
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !89 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !90, metadata !DIExpression()), !dbg !91
  store i32* null, i32** %data, align 8, !dbg !92
  %call = call i32 @staticReturnsFalse(), !dbg !93
  %tobool = icmp ne i32 %call, 0, !dbg !93
  br i1 %tobool, label %if.then, label %if.else, !dbg !95

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !96
  br label %if.end, !dbg !98

if.else:                                          ; preds = %entry
  %0 = alloca i8, i64 40, align 16, !dbg !99
  %1 = bitcast i8* %0 to i32*, !dbg !101
  store i32* %1, i32** %data, align 8, !dbg !102
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !103, metadata !DIExpression()), !dbg !105
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !105
  call void @llvm.dbg.declare(metadata i64* %i, metadata !106, metadata !DIExpression()), !dbg !107
  store i64 0, i64* %i, align 8, !dbg !108
  br label %for.cond, !dbg !110

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !111
  %cmp = icmp ult i64 %3, 10, !dbg !113
  br i1 %cmp, label %for.body, label %for.end, !dbg !114

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !115
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %4, !dbg !117
  %5 = load i32, i32* %arrayidx, align 4, !dbg !117
  %6 = load i32*, i32** %data, align 8, !dbg !118
  %7 = load i64, i64* %i, align 8, !dbg !119
  %arrayidx1 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !118
  store i32 %5, i32* %arrayidx1, align 4, !dbg !120
  br label %for.inc, !dbg !121

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !122
  %inc = add i64 %8, 1, !dbg !122
  store i64 %inc, i64* %i, align 8, !dbg !122
  br label %for.cond, !dbg !123, !llvm.loop !124

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !126
  %arrayidx2 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !126
  %10 = load i32, i32* %arrayidx2, align 4, !dbg !126
  call void @printIntLine(i32 %10), !dbg !127
  ret void, !dbg !128
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !129 {
entry:
  ret i32 0, !dbg !130
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !131 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !132, metadata !DIExpression()), !dbg !133
  store i32* null, i32** %data, align 8, !dbg !134
  %call = call i32 @staticReturnsTrue(), !dbg !135
  %tobool = icmp ne i32 %call, 0, !dbg !135
  br i1 %tobool, label %if.then, label %if.end, !dbg !137

if.then:                                          ; preds = %entry
  %0 = alloca i8, i64 40, align 16, !dbg !138
  %1 = bitcast i8* %0 to i32*, !dbg !140
  store i32* %1, i32** %data, align 8, !dbg !141
  br label %if.end, !dbg !142

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !143, metadata !DIExpression()), !dbg !145
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !145
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !145
  call void @llvm.dbg.declare(metadata i64* %i, metadata !146, metadata !DIExpression()), !dbg !147
  store i64 0, i64* %i, align 8, !dbg !148
  br label %for.cond, !dbg !150

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !151
  %cmp = icmp ult i64 %3, 10, !dbg !153
  br i1 %cmp, label %for.body, label %for.end, !dbg !154

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !155
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %4, !dbg !157
  %5 = load i32, i32* %arrayidx, align 4, !dbg !157
  %6 = load i32*, i32** %data, align 8, !dbg !158
  %7 = load i64, i64* %i, align 8, !dbg !159
  %arrayidx1 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !158
  store i32 %5, i32* %arrayidx1, align 4, !dbg !160
  br label %for.inc, !dbg !161

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !162
  %inc = add i64 %8, 1, !dbg !162
  store i64 %inc, i64* %i, align 8, !dbg !162
  br label %for.cond, !dbg !163, !llvm.loop !164

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !166
  %arrayidx2 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !166
  %10 = load i32, i32* %arrayidx2, align 4, !dbg !166
  call void @printIntLine(i32 %10), !dbg !167
  ret void, !dbg !168
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_08_bad", scope: !14, file: !14, line: 35, type: !15, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 37, type: !4)
!18 = !DILocation(line: 37, column: 11, scope: !13)
!19 = !DILocation(line: 38, column: 10, scope: !13)
!20 = !DILocation(line: 39, column: 8, scope: !21)
!21 = distinct !DILexicalBlock(scope: !13, file: !14, line: 39, column: 8)
!22 = !DILocation(line: 39, column: 8, scope: !13)
!23 = !DILocation(line: 42, column: 23, scope: !24)
!24 = distinct !DILexicalBlock(scope: !21, file: !14, line: 40, column: 5)
!25 = !DILocation(line: 42, column: 16, scope: !24)
!26 = !DILocation(line: 42, column: 14, scope: !24)
!27 = !DILocation(line: 43, column: 5, scope: !24)
!28 = !DILocalVariable(name: "source", scope: !29, file: !14, line: 45, type: !30)
!29 = distinct !DILexicalBlock(scope: !13, file: !14, line: 44, column: 5)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 10)
!33 = !DILocation(line: 45, column: 13, scope: !29)
!34 = !DILocalVariable(name: "i", scope: !29, file: !14, line: 46, type: !35)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !36, line: 46, baseType: !37)
!36 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!37 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!38 = !DILocation(line: 46, column: 16, scope: !29)
!39 = !DILocation(line: 48, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !29, file: !14, line: 48, column: 9)
!41 = !DILocation(line: 48, column: 14, scope: !40)
!42 = !DILocation(line: 48, column: 21, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !14, line: 48, column: 9)
!44 = !DILocation(line: 48, column: 23, scope: !43)
!45 = !DILocation(line: 48, column: 9, scope: !40)
!46 = !DILocation(line: 50, column: 30, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !14, line: 49, column: 9)
!48 = !DILocation(line: 50, column: 23, scope: !47)
!49 = !DILocation(line: 50, column: 13, scope: !47)
!50 = !DILocation(line: 50, column: 18, scope: !47)
!51 = !DILocation(line: 50, column: 21, scope: !47)
!52 = !DILocation(line: 51, column: 9, scope: !47)
!53 = !DILocation(line: 48, column: 30, scope: !43)
!54 = !DILocation(line: 48, column: 9, scope: !43)
!55 = distinct !{!55, !45, !56, !57}
!56 = !DILocation(line: 51, column: 9, scope: !40)
!57 = !{!"llvm.loop.mustprogress"}
!58 = !DILocation(line: 52, column: 22, scope: !29)
!59 = !DILocation(line: 52, column: 9, scope: !29)
!60 = !DILocation(line: 54, column: 1, scope: !13)
!61 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_08_good", scope: !14, file: !14, line: 109, type: !15, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocation(line: 111, column: 5, scope: !61)
!63 = !DILocation(line: 112, column: 5, scope: !61)
!64 = !DILocation(line: 113, column: 1, scope: !61)
!65 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 125, type: !66, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{!5, !5, !68}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !14, line: 125, type: !5)
!72 = !DILocation(line: 125, column: 14, scope: !65)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !14, line: 125, type: !68)
!74 = !DILocation(line: 125, column: 27, scope: !65)
!75 = !DILocation(line: 128, column: 22, scope: !65)
!76 = !DILocation(line: 128, column: 12, scope: !65)
!77 = !DILocation(line: 128, column: 5, scope: !65)
!78 = !DILocation(line: 130, column: 5, scope: !65)
!79 = !DILocation(line: 131, column: 5, scope: !65)
!80 = !DILocation(line: 132, column: 5, scope: !65)
!81 = !DILocation(line: 135, column: 5, scope: !65)
!82 = !DILocation(line: 136, column: 5, scope: !65)
!83 = !DILocation(line: 137, column: 5, scope: !65)
!84 = !DILocation(line: 139, column: 5, scope: !65)
!85 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !14, file: !14, line: 23, type: !86, scopeLine: 24, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DISubroutineType(types: !87)
!87 = !{!5}
!88 = !DILocation(line: 25, column: 5, scope: !85)
!89 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 61, type: !15, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocalVariable(name: "data", scope: !89, file: !14, line: 63, type: !4)
!91 = !DILocation(line: 63, column: 11, scope: !89)
!92 = !DILocation(line: 64, column: 10, scope: !89)
!93 = !DILocation(line: 65, column: 8, scope: !94)
!94 = distinct !DILexicalBlock(scope: !89, file: !14, line: 65, column: 8)
!95 = !DILocation(line: 65, column: 8, scope: !89)
!96 = !DILocation(line: 68, column: 9, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !14, line: 66, column: 5)
!98 = !DILocation(line: 69, column: 5, scope: !97)
!99 = !DILocation(line: 73, column: 23, scope: !100)
!100 = distinct !DILexicalBlock(scope: !94, file: !14, line: 71, column: 5)
!101 = !DILocation(line: 73, column: 16, scope: !100)
!102 = !DILocation(line: 73, column: 14, scope: !100)
!103 = !DILocalVariable(name: "source", scope: !104, file: !14, line: 76, type: !30)
!104 = distinct !DILexicalBlock(scope: !89, file: !14, line: 75, column: 5)
!105 = !DILocation(line: 76, column: 13, scope: !104)
!106 = !DILocalVariable(name: "i", scope: !104, file: !14, line: 77, type: !35)
!107 = !DILocation(line: 77, column: 16, scope: !104)
!108 = !DILocation(line: 79, column: 16, scope: !109)
!109 = distinct !DILexicalBlock(scope: !104, file: !14, line: 79, column: 9)
!110 = !DILocation(line: 79, column: 14, scope: !109)
!111 = !DILocation(line: 79, column: 21, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !14, line: 79, column: 9)
!113 = !DILocation(line: 79, column: 23, scope: !112)
!114 = !DILocation(line: 79, column: 9, scope: !109)
!115 = !DILocation(line: 81, column: 30, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !14, line: 80, column: 9)
!117 = !DILocation(line: 81, column: 23, scope: !116)
!118 = !DILocation(line: 81, column: 13, scope: !116)
!119 = !DILocation(line: 81, column: 18, scope: !116)
!120 = !DILocation(line: 81, column: 21, scope: !116)
!121 = !DILocation(line: 82, column: 9, scope: !116)
!122 = !DILocation(line: 79, column: 30, scope: !112)
!123 = !DILocation(line: 79, column: 9, scope: !112)
!124 = distinct !{!124, !114, !125, !57}
!125 = !DILocation(line: 82, column: 9, scope: !109)
!126 = !DILocation(line: 83, column: 22, scope: !104)
!127 = !DILocation(line: 83, column: 9, scope: !104)
!128 = !DILocation(line: 85, column: 1, scope: !89)
!129 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !14, file: !14, line: 28, type: !86, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!130 = !DILocation(line: 30, column: 5, scope: !129)
!131 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 88, type: !15, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!132 = !DILocalVariable(name: "data", scope: !131, file: !14, line: 90, type: !4)
!133 = !DILocation(line: 90, column: 11, scope: !131)
!134 = !DILocation(line: 91, column: 10, scope: !131)
!135 = !DILocation(line: 92, column: 8, scope: !136)
!136 = distinct !DILexicalBlock(scope: !131, file: !14, line: 92, column: 8)
!137 = !DILocation(line: 92, column: 8, scope: !131)
!138 = !DILocation(line: 95, column: 23, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !14, line: 93, column: 5)
!140 = !DILocation(line: 95, column: 16, scope: !139)
!141 = !DILocation(line: 95, column: 14, scope: !139)
!142 = !DILocation(line: 96, column: 5, scope: !139)
!143 = !DILocalVariable(name: "source", scope: !144, file: !14, line: 98, type: !30)
!144 = distinct !DILexicalBlock(scope: !131, file: !14, line: 97, column: 5)
!145 = !DILocation(line: 98, column: 13, scope: !144)
!146 = !DILocalVariable(name: "i", scope: !144, file: !14, line: 99, type: !35)
!147 = !DILocation(line: 99, column: 16, scope: !144)
!148 = !DILocation(line: 101, column: 16, scope: !149)
!149 = distinct !DILexicalBlock(scope: !144, file: !14, line: 101, column: 9)
!150 = !DILocation(line: 101, column: 14, scope: !149)
!151 = !DILocation(line: 101, column: 21, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !14, line: 101, column: 9)
!153 = !DILocation(line: 101, column: 23, scope: !152)
!154 = !DILocation(line: 101, column: 9, scope: !149)
!155 = !DILocation(line: 103, column: 30, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !14, line: 102, column: 9)
!157 = !DILocation(line: 103, column: 23, scope: !156)
!158 = !DILocation(line: 103, column: 13, scope: !156)
!159 = !DILocation(line: 103, column: 18, scope: !156)
!160 = !DILocation(line: 103, column: 21, scope: !156)
!161 = !DILocation(line: 104, column: 9, scope: !156)
!162 = !DILocation(line: 101, column: 30, scope: !152)
!163 = !DILocation(line: 101, column: 9, scope: !152)
!164 = distinct !{!164, !154, !165, !57}
!165 = !DILocation(line: 104, column: 9, scope: !149)
!166 = !DILocation(line: 105, column: 22, scope: !144)
!167 = !DILocation(line: 105, column: 9, scope: !144)
!168 = !DILocation(line: 107, column: 1, scope: !131)
