; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_13.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_13_bad() #0 !dbg !11 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !15, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !33
  %cmp = icmp eq i32 %0, 5, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !37
  store i64* %arraydecay, i64** %data, align 8, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !41, metadata !DIExpression()), !dbg !43
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !49
  store i64 0, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !53
  %cmp1 = icmp ult i64 %2, 100, !dbg !55
  br i1 %cmp1, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %3, !dbg !59
  %4 = load i64, i64* %arrayidx, align 8, !dbg !59
  %5 = load i64*, i64** %data, align 8, !dbg !60
  %6 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx2 = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !60
  store i64 %4, i64* %arrayidx2, align 8, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !64
  %inc = add i64 %7, 1, !dbg !64
  store i64 %inc, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %data, align 8, !dbg !69
  %arrayidx3 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !69
  %9 = load i64, i64* %arrayidx3, align 8, !dbg !69
  call void @printLongLongLine(i64 %9), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_13_good() #0 !dbg !72 {
entry:
  call void @goodG2B1(), !dbg !73
  call void @goodG2B2(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !76 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !83, metadata !DIExpression()), !dbg !84
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call i64 @time(i64* null) #5, !dbg !87
  %conv = trunc i64 %call to i32, !dbg !88
  call void @srand(i32 %conv) #5, !dbg !89
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !90
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_13_good(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_13_bad(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  ret i32 0, !dbg !96
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !97 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !104
  %cmp = icmp ne i32 %0, 5, !dbg !106
  br i1 %cmp, label %if.then, label %if.else, !dbg !107

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !108
  br label %if.end, !dbg !110

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !111
  store i64* %arraydecay, i64** %data, align 8, !dbg !113
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !114, metadata !DIExpression()), !dbg !116
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !116
  call void @llvm.dbg.declare(metadata i64* %i, metadata !117, metadata !DIExpression()), !dbg !119
  store i64 0, i64* %i, align 8, !dbg !120
  br label %for.cond, !dbg !122

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !123
  %cmp1 = icmp ult i64 %2, 100, !dbg !125
  br i1 %cmp1, label %for.body, label %for.end, !dbg !126

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !127
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %3, !dbg !129
  %4 = load i64, i64* %arrayidx, align 8, !dbg !129
  %5 = load i64*, i64** %data, align 8, !dbg !130
  %6 = load i64, i64* %i, align 8, !dbg !131
  %arrayidx2 = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !130
  store i64 %4, i64* %arrayidx2, align 8, !dbg !132
  br label %for.inc, !dbg !133

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !134
  %inc = add i64 %7, 1, !dbg !134
  store i64 %inc, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !135, !llvm.loop !136

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %data, align 8, !dbg !138
  %arrayidx3 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !138
  %9 = load i64, i64* %arrayidx3, align 8, !dbg !138
  call void @printLongLongLine(i64 %9), !dbg !139
  ret void, !dbg !140
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !141 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !142, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !144, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !146, metadata !DIExpression()), !dbg !147
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !148
  %cmp = icmp eq i32 %0, 5, !dbg !150
  br i1 %cmp, label %if.then, label %if.end, !dbg !151

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !152
  store i64* %arraydecay, i64** %data, align 8, !dbg !154
  br label %if.end, !dbg !155

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !156, metadata !DIExpression()), !dbg !158
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !158
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !158
  call void @llvm.dbg.declare(metadata i64* %i, metadata !159, metadata !DIExpression()), !dbg !161
  store i64 0, i64* %i, align 8, !dbg !162
  br label %for.cond, !dbg !164

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !165
  %cmp1 = icmp ult i64 %2, 100, !dbg !167
  br i1 %cmp1, label %for.body, label %for.end, !dbg !168

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !169
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %3, !dbg !171
  %4 = load i64, i64* %arrayidx, align 8, !dbg !171
  %5 = load i64*, i64** %data, align 8, !dbg !172
  %6 = load i64, i64* %i, align 8, !dbg !173
  %arrayidx2 = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !172
  store i64 %4, i64* %arrayidx2, align 8, !dbg !174
  br label %for.inc, !dbg !175

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !176
  %inc = add i64 %7, 1, !dbg !176
  store i64 %inc, i64* %i, align 8, !dbg !176
  br label %for.cond, !dbg !177, !llvm.loop !178

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %data, align 8, !dbg !180
  %arrayidx3 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !180
  %9 = load i64, i64* %arrayidx3, align 8, !dbg !180
  call void @printLongLongLine(i64 %9), !dbg !181
  ret void, !dbg !182
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_13.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_13_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_13.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 23, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !18, line: 27, baseType: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !20, line: 44, baseType: !21)
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
!35 = !DILocation(line: 26, column: 25, scope: !34)
!36 = !DILocation(line: 26, column: 8, scope: !11)
!37 = !DILocation(line: 30, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !12, line: 27, column: 5)
!39 = !DILocation(line: 30, column: 14, scope: !38)
!40 = !DILocation(line: 31, column: 5, scope: !38)
!41 = !DILocalVariable(name: "source", scope: !42, file: !12, line: 33, type: !29)
!42 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 5)
!43 = !DILocation(line: 33, column: 17, scope: !42)
!44 = !DILocalVariable(name: "i", scope: !45, file: !12, line: 35, type: !46)
!45 = distinct !DILexicalBlock(scope: !42, file: !12, line: 34, column: 9)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 46, baseType: !48)
!47 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!48 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 35, column: 20, scope: !45)
!50 = !DILocation(line: 37, column: 20, scope: !51)
!51 = distinct !DILexicalBlock(scope: !45, file: !12, line: 37, column: 13)
!52 = !DILocation(line: 37, column: 18, scope: !51)
!53 = !DILocation(line: 37, column: 25, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !12, line: 37, column: 13)
!55 = !DILocation(line: 37, column: 27, scope: !54)
!56 = !DILocation(line: 37, column: 13, scope: !51)
!57 = !DILocation(line: 39, column: 34, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !12, line: 38, column: 13)
!59 = !DILocation(line: 39, column: 27, scope: !58)
!60 = !DILocation(line: 39, column: 17, scope: !58)
!61 = !DILocation(line: 39, column: 22, scope: !58)
!62 = !DILocation(line: 39, column: 25, scope: !58)
!63 = !DILocation(line: 40, column: 13, scope: !58)
!64 = !DILocation(line: 37, column: 35, scope: !54)
!65 = !DILocation(line: 37, column: 13, scope: !54)
!66 = distinct !{!66, !56, !67, !68}
!67 = !DILocation(line: 40, column: 13, scope: !51)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocation(line: 41, column: 31, scope: !45)
!70 = !DILocation(line: 41, column: 13, scope: !45)
!71 = !DILocation(line: 44, column: 1, scope: !11)
!72 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_13_good", scope: !12, file: !12, line: 105, type: !13, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocation(line: 107, column: 5, scope: !72)
!74 = !DILocation(line: 108, column: 5, scope: !72)
!75 = !DILocation(line: 109, column: 1, scope: !72)
!76 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 121, type: !77, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{!79, !79, !80}
!79 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !12, line: 121, type: !79)
!84 = !DILocation(line: 121, column: 14, scope: !76)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !12, line: 121, type: !80)
!86 = !DILocation(line: 121, column: 27, scope: !76)
!87 = !DILocation(line: 124, column: 22, scope: !76)
!88 = !DILocation(line: 124, column: 12, scope: !76)
!89 = !DILocation(line: 124, column: 5, scope: !76)
!90 = !DILocation(line: 126, column: 5, scope: !76)
!91 = !DILocation(line: 127, column: 5, scope: !76)
!92 = !DILocation(line: 128, column: 5, scope: !76)
!93 = !DILocation(line: 131, column: 5, scope: !76)
!94 = !DILocation(line: 132, column: 5, scope: !76)
!95 = !DILocation(line: 133, column: 5, scope: !76)
!96 = !DILocation(line: 135, column: 5, scope: !76)
!97 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !12, line: 53, type: !16)
!99 = !DILocation(line: 53, column: 15, scope: !97)
!100 = !DILocalVariable(name: "dataBadBuffer", scope: !97, file: !12, line: 54, type: !24)
!101 = !DILocation(line: 54, column: 13, scope: !97)
!102 = !DILocalVariable(name: "dataGoodBuffer", scope: !97, file: !12, line: 55, type: !29)
!103 = !DILocation(line: 55, column: 13, scope: !97)
!104 = !DILocation(line: 56, column: 8, scope: !105)
!105 = distinct !DILexicalBlock(scope: !97, file: !12, line: 56, column: 8)
!106 = !DILocation(line: 56, column: 25, scope: !105)
!107 = !DILocation(line: 56, column: 8, scope: !97)
!108 = !DILocation(line: 59, column: 9, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !12, line: 57, column: 5)
!110 = !DILocation(line: 60, column: 5, scope: !109)
!111 = !DILocation(line: 64, column: 16, scope: !112)
!112 = distinct !DILexicalBlock(scope: !105, file: !12, line: 62, column: 5)
!113 = !DILocation(line: 64, column: 14, scope: !112)
!114 = !DILocalVariable(name: "source", scope: !115, file: !12, line: 67, type: !29)
!115 = distinct !DILexicalBlock(scope: !97, file: !12, line: 66, column: 5)
!116 = !DILocation(line: 67, column: 17, scope: !115)
!117 = !DILocalVariable(name: "i", scope: !118, file: !12, line: 69, type: !46)
!118 = distinct !DILexicalBlock(scope: !115, file: !12, line: 68, column: 9)
!119 = !DILocation(line: 69, column: 20, scope: !118)
!120 = !DILocation(line: 71, column: 20, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !12, line: 71, column: 13)
!122 = !DILocation(line: 71, column: 18, scope: !121)
!123 = !DILocation(line: 71, column: 25, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !12, line: 71, column: 13)
!125 = !DILocation(line: 71, column: 27, scope: !124)
!126 = !DILocation(line: 71, column: 13, scope: !121)
!127 = !DILocation(line: 73, column: 34, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !12, line: 72, column: 13)
!129 = !DILocation(line: 73, column: 27, scope: !128)
!130 = !DILocation(line: 73, column: 17, scope: !128)
!131 = !DILocation(line: 73, column: 22, scope: !128)
!132 = !DILocation(line: 73, column: 25, scope: !128)
!133 = !DILocation(line: 74, column: 13, scope: !128)
!134 = !DILocation(line: 71, column: 35, scope: !124)
!135 = !DILocation(line: 71, column: 13, scope: !124)
!136 = distinct !{!136, !126, !137, !68}
!137 = !DILocation(line: 74, column: 13, scope: !121)
!138 = !DILocation(line: 75, column: 31, scope: !118)
!139 = !DILocation(line: 75, column: 13, scope: !118)
!140 = !DILocation(line: 78, column: 1, scope: !97)
!141 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 81, type: !13, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!142 = !DILocalVariable(name: "data", scope: !141, file: !12, line: 83, type: !16)
!143 = !DILocation(line: 83, column: 15, scope: !141)
!144 = !DILocalVariable(name: "dataBadBuffer", scope: !141, file: !12, line: 84, type: !24)
!145 = !DILocation(line: 84, column: 13, scope: !141)
!146 = !DILocalVariable(name: "dataGoodBuffer", scope: !141, file: !12, line: 85, type: !29)
!147 = !DILocation(line: 85, column: 13, scope: !141)
!148 = !DILocation(line: 86, column: 8, scope: !149)
!149 = distinct !DILexicalBlock(scope: !141, file: !12, line: 86, column: 8)
!150 = !DILocation(line: 86, column: 25, scope: !149)
!151 = !DILocation(line: 86, column: 8, scope: !141)
!152 = !DILocation(line: 89, column: 16, scope: !153)
!153 = distinct !DILexicalBlock(scope: !149, file: !12, line: 87, column: 5)
!154 = !DILocation(line: 89, column: 14, scope: !153)
!155 = !DILocation(line: 90, column: 5, scope: !153)
!156 = !DILocalVariable(name: "source", scope: !157, file: !12, line: 92, type: !29)
!157 = distinct !DILexicalBlock(scope: !141, file: !12, line: 91, column: 5)
!158 = !DILocation(line: 92, column: 17, scope: !157)
!159 = !DILocalVariable(name: "i", scope: !160, file: !12, line: 94, type: !46)
!160 = distinct !DILexicalBlock(scope: !157, file: !12, line: 93, column: 9)
!161 = !DILocation(line: 94, column: 20, scope: !160)
!162 = !DILocation(line: 96, column: 20, scope: !163)
!163 = distinct !DILexicalBlock(scope: !160, file: !12, line: 96, column: 13)
!164 = !DILocation(line: 96, column: 18, scope: !163)
!165 = !DILocation(line: 96, column: 25, scope: !166)
!166 = distinct !DILexicalBlock(scope: !163, file: !12, line: 96, column: 13)
!167 = !DILocation(line: 96, column: 27, scope: !166)
!168 = !DILocation(line: 96, column: 13, scope: !163)
!169 = !DILocation(line: 98, column: 34, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !12, line: 97, column: 13)
!171 = !DILocation(line: 98, column: 27, scope: !170)
!172 = !DILocation(line: 98, column: 17, scope: !170)
!173 = !DILocation(line: 98, column: 22, scope: !170)
!174 = !DILocation(line: 98, column: 25, scope: !170)
!175 = !DILocation(line: 99, column: 13, scope: !170)
!176 = !DILocation(line: 96, column: 35, scope: !166)
!177 = !DILocation(line: 96, column: 13, scope: !166)
!178 = distinct !{!178, !168, !179, !68}
!179 = !DILocation(line: 99, column: 13, scope: !163)
!180 = !DILocation(line: 100, column: 31, scope: !160)
!181 = !DILocation(line: 100, column: 13, scope: !160)
!182 = !DILocation(line: 103, column: 1, scope: !141)
