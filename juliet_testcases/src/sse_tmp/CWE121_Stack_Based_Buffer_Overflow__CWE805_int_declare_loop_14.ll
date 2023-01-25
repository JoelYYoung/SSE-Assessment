; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_14.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_14_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %0 = load i32, i32* @globalFive, align 4, !dbg !29
  %cmp = icmp eq i32 %0, 5, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !33
  store i32* %arraydecay, i32** %data, align 8, !dbg !35
  br label %if.end, !dbg !36

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !37, metadata !DIExpression()), !dbg !39
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !39
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !45
  store i64 0, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !49
  %cmp1 = icmp ult i64 %2, 100, !dbg !51
  br i1 %cmp1, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !55
  %4 = load i32, i32* %arrayidx, align 4, !dbg !55
  %5 = load i32*, i32** %data, align 8, !dbg !56
  %6 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx2 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !56
  store i32 %4, i32* %arrayidx2, align 4, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !60
  %inc = add i64 %7, 1, !dbg !60
  store i64 %inc, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !65
  %arrayidx3 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !65
  %9 = load i32, i32* %arrayidx3, align 4, !dbg !65
  call void @printIntLine(i32 %9), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_14_good() #0 !dbg !68 {
entry:
  call void @goodG2B1(), !dbg !69
  call void @goodG2B2(), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !72 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i64 @time(i64* null) #5, !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 %conv) #5, !dbg !84
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !85
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_14_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_14_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !92 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  %0 = load i32, i32* @globalFive, align 4, !dbg !99
  %cmp = icmp ne i32 %0, 5, !dbg !101
  br i1 %cmp, label %if.then, label %if.else, !dbg !102

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !103
  br label %if.end, !dbg !105

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !106
  store i32* %arraydecay, i32** %data, align 8, !dbg !108
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !109, metadata !DIExpression()), !dbg !111
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !111
  call void @llvm.dbg.declare(metadata i64* %i, metadata !112, metadata !DIExpression()), !dbg !114
  store i64 0, i64* %i, align 8, !dbg !115
  br label %for.cond, !dbg !117

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !118
  %cmp1 = icmp ult i64 %2, 100, !dbg !120
  br i1 %cmp1, label %for.body, label %for.end, !dbg !121

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !122
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !124
  %4 = load i32, i32* %arrayidx, align 4, !dbg !124
  %5 = load i32*, i32** %data, align 8, !dbg !125
  %6 = load i64, i64* %i, align 8, !dbg !126
  %arrayidx2 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !125
  store i32 %4, i32* %arrayidx2, align 4, !dbg !127
  br label %for.inc, !dbg !128

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !129
  %inc = add i64 %7, 1, !dbg !129
  store i64 %inc, i64* %i, align 8, !dbg !129
  br label %for.cond, !dbg !130, !llvm.loop !131

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !133
  %arrayidx3 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !133
  %9 = load i32, i32* %arrayidx3, align 4, !dbg !133
  call void @printIntLine(i32 %9), !dbg !134
  ret void, !dbg !135
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !136 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !137, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !139, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !141, metadata !DIExpression()), !dbg !142
  %0 = load i32, i32* @globalFive, align 4, !dbg !143
  %cmp = icmp eq i32 %0, 5, !dbg !145
  br i1 %cmp, label %if.then, label %if.end, !dbg !146

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !147
  store i32* %arraydecay, i32** %data, align 8, !dbg !149
  br label %if.end, !dbg !150

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !151, metadata !DIExpression()), !dbg !153
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !153
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !153
  call void @llvm.dbg.declare(metadata i64* %i, metadata !154, metadata !DIExpression()), !dbg !156
  store i64 0, i64* %i, align 8, !dbg !157
  br label %for.cond, !dbg !159

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !160
  %cmp1 = icmp ult i64 %2, 100, !dbg !162
  br i1 %cmp1, label %for.body, label %for.end, !dbg !163

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !164
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !166
  %4 = load i32, i32* %arrayidx, align 4, !dbg !166
  %5 = load i32*, i32** %data, align 8, !dbg !167
  %6 = load i64, i64* %i, align 8, !dbg !168
  %arrayidx2 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !167
  store i32 %4, i32* %arrayidx2, align 4, !dbg !169
  br label %for.inc, !dbg !170

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !171
  %inc = add i64 %7, 1, !dbg !171
  store i64 %inc, i64* %i, align 8, !dbg !171
  br label %for.cond, !dbg !172, !llvm.loop !173

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !175
  %arrayidx3 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !175
  %9 = load i32, i32* %arrayidx3, align 4, !dbg !175
  call void @printIntLine(i32 %9), !dbg !176
  ret void, !dbg !177
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_14.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_14_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_14.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 23, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 23, column: 11, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 24, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 50)
!23 = !DILocation(line: 24, column: 9, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 25, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 25, column: 9, scope: !11)
!29 = !DILocation(line: 26, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !11, file: !12, line: 26, column: 8)
!31 = !DILocation(line: 26, column: 18, scope: !30)
!32 = !DILocation(line: 26, column: 8, scope: !11)
!33 = !DILocation(line: 30, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !12, line: 27, column: 5)
!35 = !DILocation(line: 30, column: 14, scope: !34)
!36 = !DILocation(line: 31, column: 5, scope: !34)
!37 = !DILocalVariable(name: "source", scope: !38, file: !12, line: 33, type: !25)
!38 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 5)
!39 = !DILocation(line: 33, column: 13, scope: !38)
!40 = !DILocalVariable(name: "i", scope: !41, file: !12, line: 35, type: !42)
!41 = distinct !DILexicalBlock(scope: !38, file: !12, line: 34, column: 9)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !43, line: 46, baseType: !44)
!43 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 35, column: 20, scope: !41)
!46 = !DILocation(line: 37, column: 20, scope: !47)
!47 = distinct !DILexicalBlock(scope: !41, file: !12, line: 37, column: 13)
!48 = !DILocation(line: 37, column: 18, scope: !47)
!49 = !DILocation(line: 37, column: 25, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !12, line: 37, column: 13)
!51 = !DILocation(line: 37, column: 27, scope: !50)
!52 = !DILocation(line: 37, column: 13, scope: !47)
!53 = !DILocation(line: 39, column: 34, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !12, line: 38, column: 13)
!55 = !DILocation(line: 39, column: 27, scope: !54)
!56 = !DILocation(line: 39, column: 17, scope: !54)
!57 = !DILocation(line: 39, column: 22, scope: !54)
!58 = !DILocation(line: 39, column: 25, scope: !54)
!59 = !DILocation(line: 40, column: 13, scope: !54)
!60 = !DILocation(line: 37, column: 35, scope: !50)
!61 = !DILocation(line: 37, column: 13, scope: !50)
!62 = distinct !{!62, !52, !63, !64}
!63 = !DILocation(line: 40, column: 13, scope: !47)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 41, column: 26, scope: !41)
!66 = !DILocation(line: 41, column: 13, scope: !41)
!67 = !DILocation(line: 44, column: 1, scope: !11)
!68 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_14_good", scope: !12, file: !12, line: 105, type: !13, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocation(line: 107, column: 5, scope: !68)
!70 = !DILocation(line: 108, column: 5, scope: !68)
!71 = !DILocation(line: 109, column: 1, scope: !68)
!72 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 121, type: !73, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DISubroutineType(types: !74)
!74 = !{!17, !17, !75}
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !12, line: 121, type: !17)
!79 = !DILocation(line: 121, column: 14, scope: !72)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !12, line: 121, type: !75)
!81 = !DILocation(line: 121, column: 27, scope: !72)
!82 = !DILocation(line: 124, column: 22, scope: !72)
!83 = !DILocation(line: 124, column: 12, scope: !72)
!84 = !DILocation(line: 124, column: 5, scope: !72)
!85 = !DILocation(line: 126, column: 5, scope: !72)
!86 = !DILocation(line: 127, column: 5, scope: !72)
!87 = !DILocation(line: 128, column: 5, scope: !72)
!88 = !DILocation(line: 131, column: 5, scope: !72)
!89 = !DILocation(line: 132, column: 5, scope: !72)
!90 = !DILocation(line: 133, column: 5, scope: !72)
!91 = !DILocation(line: 135, column: 5, scope: !72)
!92 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocalVariable(name: "data", scope: !92, file: !12, line: 53, type: !16)
!94 = !DILocation(line: 53, column: 11, scope: !92)
!95 = !DILocalVariable(name: "dataBadBuffer", scope: !92, file: !12, line: 54, type: !20)
!96 = !DILocation(line: 54, column: 9, scope: !92)
!97 = !DILocalVariable(name: "dataGoodBuffer", scope: !92, file: !12, line: 55, type: !25)
!98 = !DILocation(line: 55, column: 9, scope: !92)
!99 = !DILocation(line: 56, column: 8, scope: !100)
!100 = distinct !DILexicalBlock(scope: !92, file: !12, line: 56, column: 8)
!101 = !DILocation(line: 56, column: 18, scope: !100)
!102 = !DILocation(line: 56, column: 8, scope: !92)
!103 = !DILocation(line: 59, column: 9, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !12, line: 57, column: 5)
!105 = !DILocation(line: 60, column: 5, scope: !104)
!106 = !DILocation(line: 64, column: 16, scope: !107)
!107 = distinct !DILexicalBlock(scope: !100, file: !12, line: 62, column: 5)
!108 = !DILocation(line: 64, column: 14, scope: !107)
!109 = !DILocalVariable(name: "source", scope: !110, file: !12, line: 67, type: !25)
!110 = distinct !DILexicalBlock(scope: !92, file: !12, line: 66, column: 5)
!111 = !DILocation(line: 67, column: 13, scope: !110)
!112 = !DILocalVariable(name: "i", scope: !113, file: !12, line: 69, type: !42)
!113 = distinct !DILexicalBlock(scope: !110, file: !12, line: 68, column: 9)
!114 = !DILocation(line: 69, column: 20, scope: !113)
!115 = !DILocation(line: 71, column: 20, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !12, line: 71, column: 13)
!117 = !DILocation(line: 71, column: 18, scope: !116)
!118 = !DILocation(line: 71, column: 25, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !12, line: 71, column: 13)
!120 = !DILocation(line: 71, column: 27, scope: !119)
!121 = !DILocation(line: 71, column: 13, scope: !116)
!122 = !DILocation(line: 73, column: 34, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !12, line: 72, column: 13)
!124 = !DILocation(line: 73, column: 27, scope: !123)
!125 = !DILocation(line: 73, column: 17, scope: !123)
!126 = !DILocation(line: 73, column: 22, scope: !123)
!127 = !DILocation(line: 73, column: 25, scope: !123)
!128 = !DILocation(line: 74, column: 13, scope: !123)
!129 = !DILocation(line: 71, column: 35, scope: !119)
!130 = !DILocation(line: 71, column: 13, scope: !119)
!131 = distinct !{!131, !121, !132, !64}
!132 = !DILocation(line: 74, column: 13, scope: !116)
!133 = !DILocation(line: 75, column: 26, scope: !113)
!134 = !DILocation(line: 75, column: 13, scope: !113)
!135 = !DILocation(line: 78, column: 1, scope: !92)
!136 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 81, type: !13, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!137 = !DILocalVariable(name: "data", scope: !136, file: !12, line: 83, type: !16)
!138 = !DILocation(line: 83, column: 11, scope: !136)
!139 = !DILocalVariable(name: "dataBadBuffer", scope: !136, file: !12, line: 84, type: !20)
!140 = !DILocation(line: 84, column: 9, scope: !136)
!141 = !DILocalVariable(name: "dataGoodBuffer", scope: !136, file: !12, line: 85, type: !25)
!142 = !DILocation(line: 85, column: 9, scope: !136)
!143 = !DILocation(line: 86, column: 8, scope: !144)
!144 = distinct !DILexicalBlock(scope: !136, file: !12, line: 86, column: 8)
!145 = !DILocation(line: 86, column: 18, scope: !144)
!146 = !DILocation(line: 86, column: 8, scope: !136)
!147 = !DILocation(line: 89, column: 16, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !12, line: 87, column: 5)
!149 = !DILocation(line: 89, column: 14, scope: !148)
!150 = !DILocation(line: 90, column: 5, scope: !148)
!151 = !DILocalVariable(name: "source", scope: !152, file: !12, line: 92, type: !25)
!152 = distinct !DILexicalBlock(scope: !136, file: !12, line: 91, column: 5)
!153 = !DILocation(line: 92, column: 13, scope: !152)
!154 = !DILocalVariable(name: "i", scope: !155, file: !12, line: 94, type: !42)
!155 = distinct !DILexicalBlock(scope: !152, file: !12, line: 93, column: 9)
!156 = !DILocation(line: 94, column: 20, scope: !155)
!157 = !DILocation(line: 96, column: 20, scope: !158)
!158 = distinct !DILexicalBlock(scope: !155, file: !12, line: 96, column: 13)
!159 = !DILocation(line: 96, column: 18, scope: !158)
!160 = !DILocation(line: 96, column: 25, scope: !161)
!161 = distinct !DILexicalBlock(scope: !158, file: !12, line: 96, column: 13)
!162 = !DILocation(line: 96, column: 27, scope: !161)
!163 = !DILocation(line: 96, column: 13, scope: !158)
!164 = !DILocation(line: 98, column: 34, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !12, line: 97, column: 13)
!166 = !DILocation(line: 98, column: 27, scope: !165)
!167 = !DILocation(line: 98, column: 17, scope: !165)
!168 = !DILocation(line: 98, column: 22, scope: !165)
!169 = !DILocation(line: 98, column: 25, scope: !165)
!170 = !DILocation(line: 99, column: 13, scope: !165)
!171 = !DILocation(line: 96, column: 35, scope: !161)
!172 = !DILocation(line: 96, column: 13, scope: !161)
!173 = distinct !{!173, !163, !174, !64}
!174 = !DILocation(line: 99, column: 13, scope: !158)
!175 = !DILocation(line: 100, column: 26, scope: !155)
!176 = !DILocation(line: 100, column: 13, scope: !155)
!177 = !DILocation(line: 103, column: 1, scope: !136)
