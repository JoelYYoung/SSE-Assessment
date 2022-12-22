; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_08_bad() #0 !dbg !11 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !15, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  %call = call i32 @staticReturnsTrue(), !dbg !33
  %tobool = icmp ne i32 %call, 0, !dbg !33
  br i1 %tobool, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !36
  store i64* %arraydecay, i64** %data, align 8, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !40, metadata !DIExpression()), !dbg !42
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !48
  store i64 0, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !52
  %cmp = icmp ult i64 %1, 100, !dbg !54
  br i1 %cmp, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %2, !dbg !58
  %3 = load i64, i64* %arrayidx, align 8, !dbg !58
  %4 = load i64*, i64** %data, align 8, !dbg !59
  %5 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !59
  store i64 %3, i64* %arrayidx1, align 8, !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !63
  %inc = add i64 %6, 1, !dbg !63
  store i64 %inc, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %data, align 8, !dbg !68
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !68
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !68
  call void @printLongLongLine(i64 %8), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_08_good() #0 !dbg !71 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_08_good(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_08_bad(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !96 {
entry:
  ret i32 1, !dbg !99
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !100 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %call = call i32 @staticReturnsFalse(), !dbg !107
  %tobool = icmp ne i32 %call, 0, !dbg !107
  br i1 %tobool, label %if.then, label %if.else, !dbg !109

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !110
  br label %if.end, !dbg !112

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !113
  store i64* %arraydecay, i64** %data, align 8, !dbg !115
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !116, metadata !DIExpression()), !dbg !118
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !118
  call void @llvm.dbg.declare(metadata i64* %i, metadata !119, metadata !DIExpression()), !dbg !121
  store i64 0, i64* %i, align 8, !dbg !122
  br label %for.cond, !dbg !124

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !125
  %cmp = icmp ult i64 %1, 100, !dbg !127
  br i1 %cmp, label %for.body, label %for.end, !dbg !128

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !129
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %2, !dbg !131
  %3 = load i64, i64* %arrayidx, align 8, !dbg !131
  %4 = load i64*, i64** %data, align 8, !dbg !132
  %5 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !132
  store i64 %3, i64* %arrayidx1, align 8, !dbg !134
  br label %for.inc, !dbg !135

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !136
  %inc = add i64 %6, 1, !dbg !136
  store i64 %inc, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !137, !llvm.loop !138

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %data, align 8, !dbg !140
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !140
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !140
  call void @printLongLongLine(i64 %8), !dbg !141
  ret void, !dbg !142
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !143 {
entry:
  ret i32 0, !dbg !144
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !145 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !146, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !148, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !150, metadata !DIExpression()), !dbg !151
  %call = call i32 @staticReturnsTrue(), !dbg !152
  %tobool = icmp ne i32 %call, 0, !dbg !152
  br i1 %tobool, label %if.then, label %if.end, !dbg !154

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !155
  store i64* %arraydecay, i64** %data, align 8, !dbg !157
  br label %if.end, !dbg !158

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !159, metadata !DIExpression()), !dbg !161
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !161
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !161
  call void @llvm.dbg.declare(metadata i64* %i, metadata !162, metadata !DIExpression()), !dbg !164
  store i64 0, i64* %i, align 8, !dbg !165
  br label %for.cond, !dbg !167

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !168
  %cmp = icmp ult i64 %1, 100, !dbg !170
  br i1 %cmp, label %for.body, label %for.end, !dbg !171

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !172
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %2, !dbg !174
  %3 = load i64, i64* %arrayidx, align 8, !dbg !174
  %4 = load i64*, i64** %data, align 8, !dbg !175
  %5 = load i64, i64* %i, align 8, !dbg !176
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !175
  store i64 %3, i64* %arrayidx1, align 8, !dbg !177
  br label %for.inc, !dbg !178

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !179
  %inc = add i64 %6, 1, !dbg !179
  store i64 %inc, i64* %i, align 8, !dbg !179
  br label %for.cond, !dbg !180, !llvm.loop !181

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %data, align 8, !dbg !183
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !183
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !183
  call void @printLongLongLine(i64 %8), !dbg !184
  ret void, !dbg !185
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_08.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_08_bad", scope: !12, file: !12, line: 35, type: !13, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_08.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 37, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !18, line: 27, baseType: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !20, line: 43, baseType: !21)
!20 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!21 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!22 = !DILocation(line: 37, column: 15, scope: !11)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 38, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 50)
!27 = !DILocation(line: 38, column: 13, scope: !11)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 39, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 39, column: 13, scope: !11)
!33 = !DILocation(line: 40, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 8)
!35 = !DILocation(line: 40, column: 8, scope: !11)
!36 = !DILocation(line: 44, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !12, line: 41, column: 5)
!38 = !DILocation(line: 44, column: 14, scope: !37)
!39 = !DILocation(line: 45, column: 5, scope: !37)
!40 = !DILocalVariable(name: "source", scope: !41, file: !12, line: 47, type: !29)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 46, column: 5)
!42 = !DILocation(line: 47, column: 17, scope: !41)
!43 = !DILocalVariable(name: "i", scope: !44, file: !12, line: 49, type: !45)
!44 = distinct !DILexicalBlock(scope: !41, file: !12, line: 48, column: 9)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !46, line: 46, baseType: !47)
!46 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 49, column: 20, scope: !44)
!49 = !DILocation(line: 51, column: 20, scope: !50)
!50 = distinct !DILexicalBlock(scope: !44, file: !12, line: 51, column: 13)
!51 = !DILocation(line: 51, column: 18, scope: !50)
!52 = !DILocation(line: 51, column: 25, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !12, line: 51, column: 13)
!54 = !DILocation(line: 51, column: 27, scope: !53)
!55 = !DILocation(line: 51, column: 13, scope: !50)
!56 = !DILocation(line: 53, column: 34, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !12, line: 52, column: 13)
!58 = !DILocation(line: 53, column: 27, scope: !57)
!59 = !DILocation(line: 53, column: 17, scope: !57)
!60 = !DILocation(line: 53, column: 22, scope: !57)
!61 = !DILocation(line: 53, column: 25, scope: !57)
!62 = !DILocation(line: 54, column: 13, scope: !57)
!63 = !DILocation(line: 51, column: 35, scope: !53)
!64 = !DILocation(line: 51, column: 13, scope: !53)
!65 = distinct !{!65, !55, !66, !67}
!66 = !DILocation(line: 54, column: 13, scope: !50)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocation(line: 55, column: 31, scope: !44)
!69 = !DILocation(line: 55, column: 13, scope: !44)
!70 = !DILocation(line: 58, column: 1, scope: !11)
!71 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_08_good", scope: !12, file: !12, line: 119, type: !13, scopeLine: 120, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocation(line: 121, column: 5, scope: !71)
!73 = !DILocation(line: 122, column: 5, scope: !71)
!74 = !DILocation(line: 123, column: 1, scope: !71)
!75 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 135, type: !76, scopeLine: 136, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!78, !78, !79}
!78 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !12, line: 135, type: !78)
!83 = !DILocation(line: 135, column: 14, scope: !75)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !12, line: 135, type: !79)
!85 = !DILocation(line: 135, column: 27, scope: !75)
!86 = !DILocation(line: 138, column: 22, scope: !75)
!87 = !DILocation(line: 138, column: 12, scope: !75)
!88 = !DILocation(line: 138, column: 5, scope: !75)
!89 = !DILocation(line: 140, column: 5, scope: !75)
!90 = !DILocation(line: 141, column: 5, scope: !75)
!91 = !DILocation(line: 142, column: 5, scope: !75)
!92 = !DILocation(line: 145, column: 5, scope: !75)
!93 = !DILocation(line: 146, column: 5, scope: !75)
!94 = !DILocation(line: 147, column: 5, scope: !75)
!95 = !DILocation(line: 149, column: 5, scope: !75)
!96 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 23, type: !97, scopeLine: 24, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DISubroutineType(types: !98)
!98 = !{!78}
!99 = !DILocation(line: 25, column: 5, scope: !96)
!100 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 65, type: !13, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocalVariable(name: "data", scope: !100, file: !12, line: 67, type: !16)
!102 = !DILocation(line: 67, column: 15, scope: !100)
!103 = !DILocalVariable(name: "dataBadBuffer", scope: !100, file: !12, line: 68, type: !24)
!104 = !DILocation(line: 68, column: 13, scope: !100)
!105 = !DILocalVariable(name: "dataGoodBuffer", scope: !100, file: !12, line: 69, type: !29)
!106 = !DILocation(line: 69, column: 13, scope: !100)
!107 = !DILocation(line: 70, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !100, file: !12, line: 70, column: 8)
!109 = !DILocation(line: 70, column: 8, scope: !100)
!110 = !DILocation(line: 73, column: 9, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !12, line: 71, column: 5)
!112 = !DILocation(line: 74, column: 5, scope: !111)
!113 = !DILocation(line: 78, column: 16, scope: !114)
!114 = distinct !DILexicalBlock(scope: !108, file: !12, line: 76, column: 5)
!115 = !DILocation(line: 78, column: 14, scope: !114)
!116 = !DILocalVariable(name: "source", scope: !117, file: !12, line: 81, type: !29)
!117 = distinct !DILexicalBlock(scope: !100, file: !12, line: 80, column: 5)
!118 = !DILocation(line: 81, column: 17, scope: !117)
!119 = !DILocalVariable(name: "i", scope: !120, file: !12, line: 83, type: !45)
!120 = distinct !DILexicalBlock(scope: !117, file: !12, line: 82, column: 9)
!121 = !DILocation(line: 83, column: 20, scope: !120)
!122 = !DILocation(line: 85, column: 20, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !12, line: 85, column: 13)
!124 = !DILocation(line: 85, column: 18, scope: !123)
!125 = !DILocation(line: 85, column: 25, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !12, line: 85, column: 13)
!127 = !DILocation(line: 85, column: 27, scope: !126)
!128 = !DILocation(line: 85, column: 13, scope: !123)
!129 = !DILocation(line: 87, column: 34, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !12, line: 86, column: 13)
!131 = !DILocation(line: 87, column: 27, scope: !130)
!132 = !DILocation(line: 87, column: 17, scope: !130)
!133 = !DILocation(line: 87, column: 22, scope: !130)
!134 = !DILocation(line: 87, column: 25, scope: !130)
!135 = !DILocation(line: 88, column: 13, scope: !130)
!136 = !DILocation(line: 85, column: 35, scope: !126)
!137 = !DILocation(line: 85, column: 13, scope: !126)
!138 = distinct !{!138, !128, !139, !67}
!139 = !DILocation(line: 88, column: 13, scope: !123)
!140 = !DILocation(line: 89, column: 31, scope: !120)
!141 = !DILocation(line: 89, column: 13, scope: !120)
!142 = !DILocation(line: 92, column: 1, scope: !100)
!143 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 28, type: !97, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!144 = !DILocation(line: 30, column: 5, scope: !143)
!145 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 95, type: !13, scopeLine: 96, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!146 = !DILocalVariable(name: "data", scope: !145, file: !12, line: 97, type: !16)
!147 = !DILocation(line: 97, column: 15, scope: !145)
!148 = !DILocalVariable(name: "dataBadBuffer", scope: !145, file: !12, line: 98, type: !24)
!149 = !DILocation(line: 98, column: 13, scope: !145)
!150 = !DILocalVariable(name: "dataGoodBuffer", scope: !145, file: !12, line: 99, type: !29)
!151 = !DILocation(line: 99, column: 13, scope: !145)
!152 = !DILocation(line: 100, column: 8, scope: !153)
!153 = distinct !DILexicalBlock(scope: !145, file: !12, line: 100, column: 8)
!154 = !DILocation(line: 100, column: 8, scope: !145)
!155 = !DILocation(line: 103, column: 16, scope: !156)
!156 = distinct !DILexicalBlock(scope: !153, file: !12, line: 101, column: 5)
!157 = !DILocation(line: 103, column: 14, scope: !156)
!158 = !DILocation(line: 104, column: 5, scope: !156)
!159 = !DILocalVariable(name: "source", scope: !160, file: !12, line: 106, type: !29)
!160 = distinct !DILexicalBlock(scope: !145, file: !12, line: 105, column: 5)
!161 = !DILocation(line: 106, column: 17, scope: !160)
!162 = !DILocalVariable(name: "i", scope: !163, file: !12, line: 108, type: !45)
!163 = distinct !DILexicalBlock(scope: !160, file: !12, line: 107, column: 9)
!164 = !DILocation(line: 108, column: 20, scope: !163)
!165 = !DILocation(line: 110, column: 20, scope: !166)
!166 = distinct !DILexicalBlock(scope: !163, file: !12, line: 110, column: 13)
!167 = !DILocation(line: 110, column: 18, scope: !166)
!168 = !DILocation(line: 110, column: 25, scope: !169)
!169 = distinct !DILexicalBlock(scope: !166, file: !12, line: 110, column: 13)
!170 = !DILocation(line: 110, column: 27, scope: !169)
!171 = !DILocation(line: 110, column: 13, scope: !166)
!172 = !DILocation(line: 112, column: 34, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !12, line: 111, column: 13)
!174 = !DILocation(line: 112, column: 27, scope: !173)
!175 = !DILocation(line: 112, column: 17, scope: !173)
!176 = !DILocation(line: 112, column: 22, scope: !173)
!177 = !DILocation(line: 112, column: 25, scope: !173)
!178 = !DILocation(line: 113, column: 13, scope: !173)
!179 = !DILocation(line: 110, column: 35, scope: !169)
!180 = !DILocation(line: 110, column: 13, scope: !169)
!181 = distinct !{!181, !171, !182, !67}
!182 = !DILocation(line: 113, column: 13, scope: !166)
!183 = !DILocation(line: 114, column: 31, scope: !163)
!184 = !DILocation(line: 114, column: 13, scope: !163)
!185 = !DILocation(line: 117, column: 1, scope: !145)
