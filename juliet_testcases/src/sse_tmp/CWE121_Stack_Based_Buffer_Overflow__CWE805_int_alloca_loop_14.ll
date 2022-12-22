; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_14.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_14_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 200, align 16, !dbg !21
  %1 = bitcast i8* %0 to i32*, !dbg !22
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %2 = alloca i8, i64 400, align 16, !dbg !25
  %3 = bitcast i8* %2 to i32*, !dbg !26
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !24
  %4 = load i32, i32* @globalFive, align 4, !dbg !27
  %cmp = icmp eq i32 %4, 5, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !31
  store i32* %5, i32** %data, align 8, !dbg !33
  br label %if.end, !dbg !34

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !35, metadata !DIExpression()), !dbg !40
  %6 = bitcast [100 x i32]* %source to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 400, i1 false), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !46
  store i64 0, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !50
  %cmp1 = icmp ult i64 %7, 100, !dbg !52
  br i1 %cmp1, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %8, !dbg !56
  %9 = load i32, i32* %arrayidx, align 4, !dbg !56
  %10 = load i32*, i32** %data, align 8, !dbg !57
  %11 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx2 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !57
  store i32 %9, i32* %arrayidx2, align 4, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !61
  %inc = add i64 %12, 1, !dbg !61
  store i64 %inc, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  %13 = load i32*, i32** %data, align 8, !dbg !66
  %arrayidx3 = getelementptr inbounds i32, i32* %13, i64 0, !dbg !66
  %14 = load i32, i32* %arrayidx3, align 4, !dbg !66
  call void @printIntLine(i32 %14), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_14_good() #0 !dbg !69 {
entry:
  call void @goodG2B1(), !dbg !70
  call void @goodG2B2(), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !73 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call i64 @time(i64* null) #5, !dbg !83
  %conv = trunc i64 %call to i32, !dbg !84
  call void @srand(i32 %conv) #5, !dbg !85
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !86
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_14_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_14_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !93 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  %0 = alloca i8, i64 200, align 16, !dbg !98
  %1 = bitcast i8* %0 to i32*, !dbg !99
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %2 = alloca i8, i64 400, align 16, !dbg !102
  %3 = bitcast i8* %2 to i32*, !dbg !103
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !101
  %4 = load i32, i32* @globalFive, align 4, !dbg !104
  %cmp = icmp ne i32 %4, 5, !dbg !106
  br i1 %cmp, label %if.then, label %if.else, !dbg !107

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !108
  br label %if.end, !dbg !110

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !111
  store i32* %5, i32** %data, align 8, !dbg !113
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !114, metadata !DIExpression()), !dbg !116
  %6 = bitcast [100 x i32]* %source to i8*, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 400, i1 false), !dbg !116
  call void @llvm.dbg.declare(metadata i64* %i, metadata !117, metadata !DIExpression()), !dbg !119
  store i64 0, i64* %i, align 8, !dbg !120
  br label %for.cond, !dbg !122

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !123
  %cmp1 = icmp ult i64 %7, 100, !dbg !125
  br i1 %cmp1, label %for.body, label %for.end, !dbg !126

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !127
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %8, !dbg !129
  %9 = load i32, i32* %arrayidx, align 4, !dbg !129
  %10 = load i32*, i32** %data, align 8, !dbg !130
  %11 = load i64, i64* %i, align 8, !dbg !131
  %arrayidx2 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !130
  store i32 %9, i32* %arrayidx2, align 4, !dbg !132
  br label %for.inc, !dbg !133

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !134
  %inc = add i64 %12, 1, !dbg !134
  store i64 %inc, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !135, !llvm.loop !136

for.end:                                          ; preds = %for.cond
  %13 = load i32*, i32** %data, align 8, !dbg !138
  %arrayidx3 = getelementptr inbounds i32, i32* %13, i64 0, !dbg !138
  %14 = load i32, i32* %arrayidx3, align 4, !dbg !138
  call void @printIntLine(i32 %14), !dbg !139
  ret void, !dbg !140
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !141 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !142, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !144, metadata !DIExpression()), !dbg !145
  %0 = alloca i8, i64 200, align 16, !dbg !146
  %1 = bitcast i8* %0 to i32*, !dbg !147
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !145
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !148, metadata !DIExpression()), !dbg !149
  %2 = alloca i8, i64 400, align 16, !dbg !150
  %3 = bitcast i8* %2 to i32*, !dbg !151
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !149
  %4 = load i32, i32* @globalFive, align 4, !dbg !152
  %cmp = icmp eq i32 %4, 5, !dbg !154
  br i1 %cmp, label %if.then, label %if.end, !dbg !155

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !156
  store i32* %5, i32** %data, align 8, !dbg !158
  br label %if.end, !dbg !159

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !160, metadata !DIExpression()), !dbg !162
  %6 = bitcast [100 x i32]* %source to i8*, !dbg !162
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 400, i1 false), !dbg !162
  call void @llvm.dbg.declare(metadata i64* %i, metadata !163, metadata !DIExpression()), !dbg !165
  store i64 0, i64* %i, align 8, !dbg !166
  br label %for.cond, !dbg !168

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !169
  %cmp1 = icmp ult i64 %7, 100, !dbg !171
  br i1 %cmp1, label %for.body, label %for.end, !dbg !172

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !173
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %8, !dbg !175
  %9 = load i32, i32* %arrayidx, align 4, !dbg !175
  %10 = load i32*, i32** %data, align 8, !dbg !176
  %11 = load i64, i64* %i, align 8, !dbg !177
  %arrayidx2 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !176
  store i32 %9, i32* %arrayidx2, align 4, !dbg !178
  br label %for.inc, !dbg !179

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !180
  %inc = add i64 %12, 1, !dbg !180
  store i64 %inc, i64* %i, align 8, !dbg !180
  br label %for.cond, !dbg !181, !llvm.loop !182

for.end:                                          ; preds = %for.cond
  %13 = load i32*, i32** %data, align 8, !dbg !184
  %arrayidx3 = getelementptr inbounds i32, i32* %13, i64 0, !dbg !184
  %14 = load i32, i32* %arrayidx3, align 4, !dbg !184
  call void @printIntLine(i32 %14), !dbg !185
  ret void, !dbg !186
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_14.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_14_bad", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_14.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 23, type: !4)
!18 = !DILocation(line: 23, column: 11, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 24, type: !4)
!20 = !DILocation(line: 24, column: 11, scope: !13)
!21 = !DILocation(line: 24, column: 34, scope: !13)
!22 = !DILocation(line: 24, column: 27, scope: !13)
!23 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 25, type: !4)
!24 = !DILocation(line: 25, column: 11, scope: !13)
!25 = !DILocation(line: 25, column: 35, scope: !13)
!26 = !DILocation(line: 25, column: 28, scope: !13)
!27 = !DILocation(line: 26, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !13, file: !14, line: 26, column: 8)
!29 = !DILocation(line: 26, column: 18, scope: !28)
!30 = !DILocation(line: 26, column: 8, scope: !13)
!31 = !DILocation(line: 30, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !14, line: 27, column: 5)
!33 = !DILocation(line: 30, column: 14, scope: !32)
!34 = !DILocation(line: 31, column: 5, scope: !32)
!35 = !DILocalVariable(name: "source", scope: !36, file: !14, line: 33, type: !37)
!36 = distinct !DILexicalBlock(scope: !13, file: !14, line: 32, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 100)
!40 = !DILocation(line: 33, column: 13, scope: !36)
!41 = !DILocalVariable(name: "i", scope: !42, file: !14, line: 35, type: !43)
!42 = distinct !DILexicalBlock(scope: !36, file: !14, line: 34, column: 9)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !44, line: 46, baseType: !45)
!44 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!45 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 35, column: 20, scope: !42)
!47 = !DILocation(line: 37, column: 20, scope: !48)
!48 = distinct !DILexicalBlock(scope: !42, file: !14, line: 37, column: 13)
!49 = !DILocation(line: 37, column: 18, scope: !48)
!50 = !DILocation(line: 37, column: 25, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !14, line: 37, column: 13)
!52 = !DILocation(line: 37, column: 27, scope: !51)
!53 = !DILocation(line: 37, column: 13, scope: !48)
!54 = !DILocation(line: 39, column: 34, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !14, line: 38, column: 13)
!56 = !DILocation(line: 39, column: 27, scope: !55)
!57 = !DILocation(line: 39, column: 17, scope: !55)
!58 = !DILocation(line: 39, column: 22, scope: !55)
!59 = !DILocation(line: 39, column: 25, scope: !55)
!60 = !DILocation(line: 40, column: 13, scope: !55)
!61 = !DILocation(line: 37, column: 35, scope: !51)
!62 = !DILocation(line: 37, column: 13, scope: !51)
!63 = distinct !{!63, !53, !64, !65}
!64 = !DILocation(line: 40, column: 13, scope: !48)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 41, column: 26, scope: !42)
!67 = !DILocation(line: 41, column: 13, scope: !42)
!68 = !DILocation(line: 44, column: 1, scope: !13)
!69 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_14_good", scope: !14, file: !14, line: 105, type: !15, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocation(line: 107, column: 5, scope: !69)
!71 = !DILocation(line: 108, column: 5, scope: !69)
!72 = !DILocation(line: 109, column: 1, scope: !69)
!73 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 121, type: !74, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!5, !5, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !14, line: 121, type: !5)
!80 = !DILocation(line: 121, column: 14, scope: !73)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !14, line: 121, type: !76)
!82 = !DILocation(line: 121, column: 27, scope: !73)
!83 = !DILocation(line: 124, column: 22, scope: !73)
!84 = !DILocation(line: 124, column: 12, scope: !73)
!85 = !DILocation(line: 124, column: 5, scope: !73)
!86 = !DILocation(line: 126, column: 5, scope: !73)
!87 = !DILocation(line: 127, column: 5, scope: !73)
!88 = !DILocation(line: 128, column: 5, scope: !73)
!89 = !DILocation(line: 131, column: 5, scope: !73)
!90 = !DILocation(line: 132, column: 5, scope: !73)
!91 = !DILocation(line: 133, column: 5, scope: !73)
!92 = !DILocation(line: 135, column: 5, scope: !73)
!93 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 51, type: !15, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", scope: !93, file: !14, line: 53, type: !4)
!95 = !DILocation(line: 53, column: 11, scope: !93)
!96 = !DILocalVariable(name: "dataBadBuffer", scope: !93, file: !14, line: 54, type: !4)
!97 = !DILocation(line: 54, column: 11, scope: !93)
!98 = !DILocation(line: 54, column: 34, scope: !93)
!99 = !DILocation(line: 54, column: 27, scope: !93)
!100 = !DILocalVariable(name: "dataGoodBuffer", scope: !93, file: !14, line: 55, type: !4)
!101 = !DILocation(line: 55, column: 11, scope: !93)
!102 = !DILocation(line: 55, column: 35, scope: !93)
!103 = !DILocation(line: 55, column: 28, scope: !93)
!104 = !DILocation(line: 56, column: 8, scope: !105)
!105 = distinct !DILexicalBlock(scope: !93, file: !14, line: 56, column: 8)
!106 = !DILocation(line: 56, column: 18, scope: !105)
!107 = !DILocation(line: 56, column: 8, scope: !93)
!108 = !DILocation(line: 59, column: 9, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !14, line: 57, column: 5)
!110 = !DILocation(line: 60, column: 5, scope: !109)
!111 = !DILocation(line: 64, column: 16, scope: !112)
!112 = distinct !DILexicalBlock(scope: !105, file: !14, line: 62, column: 5)
!113 = !DILocation(line: 64, column: 14, scope: !112)
!114 = !DILocalVariable(name: "source", scope: !115, file: !14, line: 67, type: !37)
!115 = distinct !DILexicalBlock(scope: !93, file: !14, line: 66, column: 5)
!116 = !DILocation(line: 67, column: 13, scope: !115)
!117 = !DILocalVariable(name: "i", scope: !118, file: !14, line: 69, type: !43)
!118 = distinct !DILexicalBlock(scope: !115, file: !14, line: 68, column: 9)
!119 = !DILocation(line: 69, column: 20, scope: !118)
!120 = !DILocation(line: 71, column: 20, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !14, line: 71, column: 13)
!122 = !DILocation(line: 71, column: 18, scope: !121)
!123 = !DILocation(line: 71, column: 25, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !14, line: 71, column: 13)
!125 = !DILocation(line: 71, column: 27, scope: !124)
!126 = !DILocation(line: 71, column: 13, scope: !121)
!127 = !DILocation(line: 73, column: 34, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !14, line: 72, column: 13)
!129 = !DILocation(line: 73, column: 27, scope: !128)
!130 = !DILocation(line: 73, column: 17, scope: !128)
!131 = !DILocation(line: 73, column: 22, scope: !128)
!132 = !DILocation(line: 73, column: 25, scope: !128)
!133 = !DILocation(line: 74, column: 13, scope: !128)
!134 = !DILocation(line: 71, column: 35, scope: !124)
!135 = !DILocation(line: 71, column: 13, scope: !124)
!136 = distinct !{!136, !126, !137, !65}
!137 = !DILocation(line: 74, column: 13, scope: !121)
!138 = !DILocation(line: 75, column: 26, scope: !118)
!139 = !DILocation(line: 75, column: 13, scope: !118)
!140 = !DILocation(line: 78, column: 1, scope: !93)
!141 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 81, type: !15, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!142 = !DILocalVariable(name: "data", scope: !141, file: !14, line: 83, type: !4)
!143 = !DILocation(line: 83, column: 11, scope: !141)
!144 = !DILocalVariable(name: "dataBadBuffer", scope: !141, file: !14, line: 84, type: !4)
!145 = !DILocation(line: 84, column: 11, scope: !141)
!146 = !DILocation(line: 84, column: 34, scope: !141)
!147 = !DILocation(line: 84, column: 27, scope: !141)
!148 = !DILocalVariable(name: "dataGoodBuffer", scope: !141, file: !14, line: 85, type: !4)
!149 = !DILocation(line: 85, column: 11, scope: !141)
!150 = !DILocation(line: 85, column: 35, scope: !141)
!151 = !DILocation(line: 85, column: 28, scope: !141)
!152 = !DILocation(line: 86, column: 8, scope: !153)
!153 = distinct !DILexicalBlock(scope: !141, file: !14, line: 86, column: 8)
!154 = !DILocation(line: 86, column: 18, scope: !153)
!155 = !DILocation(line: 86, column: 8, scope: !141)
!156 = !DILocation(line: 89, column: 16, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !14, line: 87, column: 5)
!158 = !DILocation(line: 89, column: 14, scope: !157)
!159 = !DILocation(line: 90, column: 5, scope: !157)
!160 = !DILocalVariable(name: "source", scope: !161, file: !14, line: 92, type: !37)
!161 = distinct !DILexicalBlock(scope: !141, file: !14, line: 91, column: 5)
!162 = !DILocation(line: 92, column: 13, scope: !161)
!163 = !DILocalVariable(name: "i", scope: !164, file: !14, line: 94, type: !43)
!164 = distinct !DILexicalBlock(scope: !161, file: !14, line: 93, column: 9)
!165 = !DILocation(line: 94, column: 20, scope: !164)
!166 = !DILocation(line: 96, column: 20, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !14, line: 96, column: 13)
!168 = !DILocation(line: 96, column: 18, scope: !167)
!169 = !DILocation(line: 96, column: 25, scope: !170)
!170 = distinct !DILexicalBlock(scope: !167, file: !14, line: 96, column: 13)
!171 = !DILocation(line: 96, column: 27, scope: !170)
!172 = !DILocation(line: 96, column: 13, scope: !167)
!173 = !DILocation(line: 98, column: 34, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !14, line: 97, column: 13)
!175 = !DILocation(line: 98, column: 27, scope: !174)
!176 = !DILocation(line: 98, column: 17, scope: !174)
!177 = !DILocation(line: 98, column: 22, scope: !174)
!178 = !DILocation(line: 98, column: 25, scope: !174)
!179 = !DILocation(line: 99, column: 13, scope: !174)
!180 = !DILocation(line: 96, column: 35, scope: !170)
!181 = !DILocation(line: 96, column: 13, scope: !170)
!182 = distinct !{!182, !172, !183, !65}
!183 = !DILocation(line: 99, column: 13, scope: !167)
!184 = !DILocation(line: 100, column: 26, scope: !164)
!185 = !DILocation(line: 100, column: 13, scope: !164)
!186 = !DILocation(line: 103, column: 1, scope: !141)
