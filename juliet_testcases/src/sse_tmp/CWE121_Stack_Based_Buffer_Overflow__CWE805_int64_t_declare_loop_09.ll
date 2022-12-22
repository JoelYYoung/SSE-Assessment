; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_09.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_09.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_TRUE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external dso_local constant i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_09_bad() #0 !dbg !11 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !15, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !33
  %tobool = icmp ne i32 %0, 0, !dbg !33
  br i1 %tobool, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !36
  store i64* %arraydecay, i64** %data, align 8, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !40, metadata !DIExpression()), !dbg !42
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !48
  store i64 0, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !52
  %cmp = icmp ult i64 %2, 100, !dbg !54
  br i1 %cmp, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %3, !dbg !58
  %4 = load i64, i64* %arrayidx, align 8, !dbg !58
  %5 = load i64*, i64** %data, align 8, !dbg !59
  %6 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx1 = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !59
  store i64 %4, i64* %arrayidx1, align 8, !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !63
  %inc = add i64 %7, 1, !dbg !63
  store i64 %inc, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %data, align 8, !dbg !68
  %arrayidx2 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !68
  %9 = load i64, i64* %arrayidx2, align 8, !dbg !68
  call void @printLongLongLine(i64 %9), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_09_good() #0 !dbg !71 {
entry:
  call void @goodG2B1(), !dbg !72
  call void @goodG2B2(), !dbg !73
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !82, metadata !DIExpression()), !dbg !83
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call i64 @time(i64* null) #5, !dbg !86
  %conv = trunc i64 %call to i32, !dbg !87
  call void @srand(i32 %conv) #5, !dbg !88
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !89
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_09_good(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_09_bad(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !96 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %0 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !103
  %tobool = icmp ne i32 %0, 0, !dbg !103
  br i1 %tobool, label %if.then, label %if.else, !dbg !105

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !106
  br label %if.end, !dbg !108

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !109
  store i64* %arraydecay, i64** %data, align 8, !dbg !111
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !112, metadata !DIExpression()), !dbg !114
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !114
  call void @llvm.dbg.declare(metadata i64* %i, metadata !115, metadata !DIExpression()), !dbg !117
  store i64 0, i64* %i, align 8, !dbg !118
  br label %for.cond, !dbg !120

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !121
  %cmp = icmp ult i64 %2, 100, !dbg !123
  br i1 %cmp, label %for.body, label %for.end, !dbg !124

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !125
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %3, !dbg !127
  %4 = load i64, i64* %arrayidx, align 8, !dbg !127
  %5 = load i64*, i64** %data, align 8, !dbg !128
  %6 = load i64, i64* %i, align 8, !dbg !129
  %arrayidx1 = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !128
  store i64 %4, i64* %arrayidx1, align 8, !dbg !130
  br label %for.inc, !dbg !131

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !132
  %inc = add i64 %7, 1, !dbg !132
  store i64 %inc, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !133, !llvm.loop !134

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %data, align 8, !dbg !136
  %arrayidx2 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !136
  %9 = load i64, i64* %arrayidx2, align 8, !dbg !136
  call void @printLongLongLine(i64 %9), !dbg !137
  ret void, !dbg !138
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !139 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !142, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !144, metadata !DIExpression()), !dbg !145
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !146
  %tobool = icmp ne i32 %0, 0, !dbg !146
  br i1 %tobool, label %if.then, label %if.end, !dbg !148

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !149
  store i64* %arraydecay, i64** %data, align 8, !dbg !151
  br label %if.end, !dbg !152

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !153, metadata !DIExpression()), !dbg !155
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !155
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !155
  call void @llvm.dbg.declare(metadata i64* %i, metadata !156, metadata !DIExpression()), !dbg !158
  store i64 0, i64* %i, align 8, !dbg !159
  br label %for.cond, !dbg !161

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !162
  %cmp = icmp ult i64 %2, 100, !dbg !164
  br i1 %cmp, label %for.body, label %for.end, !dbg !165

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !166
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %3, !dbg !168
  %4 = load i64, i64* %arrayidx, align 8, !dbg !168
  %5 = load i64*, i64** %data, align 8, !dbg !169
  %6 = load i64, i64* %i, align 8, !dbg !170
  %arrayidx1 = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !169
  store i64 %4, i64* %arrayidx1, align 8, !dbg !171
  br label %for.inc, !dbg !172

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !173
  %inc = add i64 %7, 1, !dbg !173
  store i64 %inc, i64* %i, align 8, !dbg !173
  br label %for.cond, !dbg !174, !llvm.loop !175

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %data, align 8, !dbg !177
  %arrayidx2 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !177
  %9 = load i64, i64* %arrayidx2, align 8, !dbg !177
  call void @printLongLongLine(i64 %9), !dbg !178
  ret void, !dbg !179
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_09.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_09_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_09.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 23, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !18, line: 27, baseType: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !20, line: 43, baseType: !21)
!20 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!21 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!22 = !DILocation(line: 23, column: 15, scope: !11)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 24, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 50)
!27 = !DILocation(line: 24, column: 13, scope: !11)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 25, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 25, column: 13, scope: !11)
!33 = !DILocation(line: 26, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 26, column: 8)
!35 = !DILocation(line: 26, column: 8, scope: !11)
!36 = !DILocation(line: 30, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !12, line: 27, column: 5)
!38 = !DILocation(line: 30, column: 14, scope: !37)
!39 = !DILocation(line: 31, column: 5, scope: !37)
!40 = !DILocalVariable(name: "source", scope: !41, file: !12, line: 33, type: !29)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 5)
!42 = !DILocation(line: 33, column: 17, scope: !41)
!43 = !DILocalVariable(name: "i", scope: !44, file: !12, line: 35, type: !45)
!44 = distinct !DILexicalBlock(scope: !41, file: !12, line: 34, column: 9)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !46, line: 46, baseType: !47)
!46 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 35, column: 20, scope: !44)
!49 = !DILocation(line: 37, column: 20, scope: !50)
!50 = distinct !DILexicalBlock(scope: !44, file: !12, line: 37, column: 13)
!51 = !DILocation(line: 37, column: 18, scope: !50)
!52 = !DILocation(line: 37, column: 25, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !12, line: 37, column: 13)
!54 = !DILocation(line: 37, column: 27, scope: !53)
!55 = !DILocation(line: 37, column: 13, scope: !50)
!56 = !DILocation(line: 39, column: 34, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !12, line: 38, column: 13)
!58 = !DILocation(line: 39, column: 27, scope: !57)
!59 = !DILocation(line: 39, column: 17, scope: !57)
!60 = !DILocation(line: 39, column: 22, scope: !57)
!61 = !DILocation(line: 39, column: 25, scope: !57)
!62 = !DILocation(line: 40, column: 13, scope: !57)
!63 = !DILocation(line: 37, column: 35, scope: !53)
!64 = !DILocation(line: 37, column: 13, scope: !53)
!65 = distinct !{!65, !55, !66, !67}
!66 = !DILocation(line: 40, column: 13, scope: !50)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocation(line: 41, column: 31, scope: !44)
!69 = !DILocation(line: 41, column: 13, scope: !44)
!70 = !DILocation(line: 44, column: 1, scope: !11)
!71 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_09_good", scope: !12, file: !12, line: 105, type: !13, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocation(line: 107, column: 5, scope: !71)
!73 = !DILocation(line: 108, column: 5, scope: !71)
!74 = !DILocation(line: 109, column: 1, scope: !71)
!75 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 121, type: !76, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!78, !78, !79}
!78 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !12, line: 121, type: !78)
!83 = !DILocation(line: 121, column: 14, scope: !75)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !12, line: 121, type: !79)
!85 = !DILocation(line: 121, column: 27, scope: !75)
!86 = !DILocation(line: 124, column: 22, scope: !75)
!87 = !DILocation(line: 124, column: 12, scope: !75)
!88 = !DILocation(line: 124, column: 5, scope: !75)
!89 = !DILocation(line: 126, column: 5, scope: !75)
!90 = !DILocation(line: 127, column: 5, scope: !75)
!91 = !DILocation(line: 128, column: 5, scope: !75)
!92 = !DILocation(line: 131, column: 5, scope: !75)
!93 = !DILocation(line: 132, column: 5, scope: !75)
!94 = !DILocation(line: 133, column: 5, scope: !75)
!95 = !DILocation(line: 135, column: 5, scope: !75)
!96 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocalVariable(name: "data", scope: !96, file: !12, line: 53, type: !16)
!98 = !DILocation(line: 53, column: 15, scope: !96)
!99 = !DILocalVariable(name: "dataBadBuffer", scope: !96, file: !12, line: 54, type: !24)
!100 = !DILocation(line: 54, column: 13, scope: !96)
!101 = !DILocalVariable(name: "dataGoodBuffer", scope: !96, file: !12, line: 55, type: !29)
!102 = !DILocation(line: 55, column: 13, scope: !96)
!103 = !DILocation(line: 56, column: 8, scope: !104)
!104 = distinct !DILexicalBlock(scope: !96, file: !12, line: 56, column: 8)
!105 = !DILocation(line: 56, column: 8, scope: !96)
!106 = !DILocation(line: 59, column: 9, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !12, line: 57, column: 5)
!108 = !DILocation(line: 60, column: 5, scope: !107)
!109 = !DILocation(line: 64, column: 16, scope: !110)
!110 = distinct !DILexicalBlock(scope: !104, file: !12, line: 62, column: 5)
!111 = !DILocation(line: 64, column: 14, scope: !110)
!112 = !DILocalVariable(name: "source", scope: !113, file: !12, line: 67, type: !29)
!113 = distinct !DILexicalBlock(scope: !96, file: !12, line: 66, column: 5)
!114 = !DILocation(line: 67, column: 17, scope: !113)
!115 = !DILocalVariable(name: "i", scope: !116, file: !12, line: 69, type: !45)
!116 = distinct !DILexicalBlock(scope: !113, file: !12, line: 68, column: 9)
!117 = !DILocation(line: 69, column: 20, scope: !116)
!118 = !DILocation(line: 71, column: 20, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !12, line: 71, column: 13)
!120 = !DILocation(line: 71, column: 18, scope: !119)
!121 = !DILocation(line: 71, column: 25, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !12, line: 71, column: 13)
!123 = !DILocation(line: 71, column: 27, scope: !122)
!124 = !DILocation(line: 71, column: 13, scope: !119)
!125 = !DILocation(line: 73, column: 34, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !12, line: 72, column: 13)
!127 = !DILocation(line: 73, column: 27, scope: !126)
!128 = !DILocation(line: 73, column: 17, scope: !126)
!129 = !DILocation(line: 73, column: 22, scope: !126)
!130 = !DILocation(line: 73, column: 25, scope: !126)
!131 = !DILocation(line: 74, column: 13, scope: !126)
!132 = !DILocation(line: 71, column: 35, scope: !122)
!133 = !DILocation(line: 71, column: 13, scope: !122)
!134 = distinct !{!134, !124, !135, !67}
!135 = !DILocation(line: 74, column: 13, scope: !119)
!136 = !DILocation(line: 75, column: 31, scope: !116)
!137 = !DILocation(line: 75, column: 13, scope: !116)
!138 = !DILocation(line: 78, column: 1, scope: !96)
!139 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 81, type: !13, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!140 = !DILocalVariable(name: "data", scope: !139, file: !12, line: 83, type: !16)
!141 = !DILocation(line: 83, column: 15, scope: !139)
!142 = !DILocalVariable(name: "dataBadBuffer", scope: !139, file: !12, line: 84, type: !24)
!143 = !DILocation(line: 84, column: 13, scope: !139)
!144 = !DILocalVariable(name: "dataGoodBuffer", scope: !139, file: !12, line: 85, type: !29)
!145 = !DILocation(line: 85, column: 13, scope: !139)
!146 = !DILocation(line: 86, column: 8, scope: !147)
!147 = distinct !DILexicalBlock(scope: !139, file: !12, line: 86, column: 8)
!148 = !DILocation(line: 86, column: 8, scope: !139)
!149 = !DILocation(line: 89, column: 16, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !12, line: 87, column: 5)
!151 = !DILocation(line: 89, column: 14, scope: !150)
!152 = !DILocation(line: 90, column: 5, scope: !150)
!153 = !DILocalVariable(name: "source", scope: !154, file: !12, line: 92, type: !29)
!154 = distinct !DILexicalBlock(scope: !139, file: !12, line: 91, column: 5)
!155 = !DILocation(line: 92, column: 17, scope: !154)
!156 = !DILocalVariable(name: "i", scope: !157, file: !12, line: 94, type: !45)
!157 = distinct !DILexicalBlock(scope: !154, file: !12, line: 93, column: 9)
!158 = !DILocation(line: 94, column: 20, scope: !157)
!159 = !DILocation(line: 96, column: 20, scope: !160)
!160 = distinct !DILexicalBlock(scope: !157, file: !12, line: 96, column: 13)
!161 = !DILocation(line: 96, column: 18, scope: !160)
!162 = !DILocation(line: 96, column: 25, scope: !163)
!163 = distinct !DILexicalBlock(scope: !160, file: !12, line: 96, column: 13)
!164 = !DILocation(line: 96, column: 27, scope: !163)
!165 = !DILocation(line: 96, column: 13, scope: !160)
!166 = !DILocation(line: 98, column: 34, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !12, line: 97, column: 13)
!168 = !DILocation(line: 98, column: 27, scope: !167)
!169 = !DILocation(line: 98, column: 17, scope: !167)
!170 = !DILocation(line: 98, column: 22, scope: !167)
!171 = !DILocation(line: 98, column: 25, scope: !167)
!172 = !DILocation(line: 99, column: 13, scope: !167)
!173 = !DILocation(line: 96, column: 35, scope: !163)
!174 = !DILocation(line: 96, column: 13, scope: !163)
!175 = distinct !{!175, !165, !176, !67}
!176 = !DILocation(line: 99, column: 13, scope: !160)
!177 = !DILocation(line: 100, column: 31, scope: !157)
!178 = !DILocation(line: 100, column: 13, scope: !157)
!179 = !DILocation(line: 103, column: 1, scope: !139)
