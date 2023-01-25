; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_12_bad() #0 !dbg !11 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !15, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !35
  %tobool = icmp ne i32 %call, 0, !dbg !35
  br i1 %tobool, label %if.then, label %if.else, !dbg !37

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !38
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !40
  br label %if.end, !dbg !41

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !42
  store %struct._twoIntsStruct* %arraydecay1, %struct._twoIntsStruct** %data, align 8, !dbg !44
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !45, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %i, metadata !48, metadata !DIExpression()), !dbg !53
  store i64 0, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %if.end
  %0 = load i64, i64* %i, align 8, !dbg !57
  %cmp = icmp ult i64 %0, 100, !dbg !59
  br i1 %cmp, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !63
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !64
  store i32 0, i32* %intOne, align 8, !dbg !65
  %2 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !67
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !68
  store i32 0, i32* %intTwo, align 4, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !71
  %inc = add i64 %3, 1, !dbg !71
  store i64 %inc, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !76, metadata !DIExpression()), !dbg !78
  store i64 0, i64* %i3, align 8, !dbg !79
  br label %for.cond4, !dbg !81

for.cond4:                                        ; preds = %for.inc9, %for.end
  %4 = load i64, i64* %i3, align 8, !dbg !82
  %cmp5 = icmp ult i64 %4, 100, !dbg !84
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !85

for.body6:                                        ; preds = %for.cond4
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !86
  %6 = load i64, i64* %i3, align 8, !dbg !88
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !86
  %7 = load i64, i64* %i3, align 8, !dbg !89
  %arrayidx8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !90
  %8 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !90
  %9 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !90
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 8 %9, i64 8, i1 false), !dbg !90
  br label %for.inc9, !dbg !91

for.inc9:                                         ; preds = %for.body6
  %10 = load i64, i64* %i3, align 8, !dbg !92
  %inc10 = add i64 %10, 1, !dbg !92
  store i64 %inc10, i64* %i3, align 8, !dbg !92
  br label %for.cond4, !dbg !93, !llvm.loop !94

for.end11:                                        ; preds = %for.cond4
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !96
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !96
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx12), !dbg !97
  ret void, !dbg !98
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_12_good() #0 !dbg !99 {
entry:
  call void @goodG2B(), !dbg !100
  ret void, !dbg !101
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !102 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !108, metadata !DIExpression()), !dbg !109
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !110, metadata !DIExpression()), !dbg !111
  %call = call i64 @time(i64* null) #5, !dbg !112
  %conv = trunc i64 %call to i32, !dbg !113
  call void @srand(i32 %conv) #5, !dbg !114
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !115
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_12_good(), !dbg !116
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !117
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !118
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_12_bad(), !dbg !119
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !120
  ret i32 0, !dbg !121
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !122 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !123, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !125, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !127, metadata !DIExpression()), !dbg !128
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !129
  %tobool = icmp ne i32 %call, 0, !dbg !129
  br i1 %tobool, label %if.then, label %if.else, !dbg !131

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !132
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !134
  br label %if.end, !dbg !135

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !136
  store %struct._twoIntsStruct* %arraydecay1, %struct._twoIntsStruct** %data, align 8, !dbg !138
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !139, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata i64* %i, metadata !142, metadata !DIExpression()), !dbg !144
  store i64 0, i64* %i, align 8, !dbg !145
  br label %for.cond, !dbg !147

for.cond:                                         ; preds = %for.inc, %if.end
  %0 = load i64, i64* %i, align 8, !dbg !148
  %cmp = icmp ult i64 %0, 100, !dbg !150
  br i1 %cmp, label %for.body, label %for.end, !dbg !151

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !152
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !154
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !155
  store i32 0, i32* %intOne, align 8, !dbg !156
  %2 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !158
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !159
  store i32 0, i32* %intTwo, align 4, !dbg !160
  br label %for.inc, !dbg !161

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !162
  %inc = add i64 %3, 1, !dbg !162
  store i64 %inc, i64* %i, align 8, !dbg !162
  br label %for.cond, !dbg !163, !llvm.loop !164

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !166, metadata !DIExpression()), !dbg !168
  store i64 0, i64* %i3, align 8, !dbg !169
  br label %for.cond4, !dbg !171

for.cond4:                                        ; preds = %for.inc9, %for.end
  %4 = load i64, i64* %i3, align 8, !dbg !172
  %cmp5 = icmp ult i64 %4, 100, !dbg !174
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !175

for.body6:                                        ; preds = %for.cond4
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !176
  %6 = load i64, i64* %i3, align 8, !dbg !178
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !176
  %7 = load i64, i64* %i3, align 8, !dbg !179
  %arrayidx8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !180
  %8 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !180
  %9 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !180
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 8 %9, i64 8, i1 false), !dbg !180
  br label %for.inc9, !dbg !181

for.inc9:                                         ; preds = %for.body6
  %10 = load i64, i64* %i3, align 8, !dbg !182
  %inc10 = add i64 %10, 1, !dbg !182
  store i64 %inc10, i64* %i3, align 8, !dbg !182
  br label %for.cond4, !dbg !183, !llvm.loop !184

for.end11:                                        ; preds = %for.cond4
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !186
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !186
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx12), !dbg !187
  ret void, !dbg !188
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_12.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_12_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_12.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 23, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !18, line: 100, baseType: !19)
!18 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!19 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !18, line: 96, size: 64, elements: !20)
!20 = !{!21, !23}
!21 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !19, file: !18, line: 98, baseType: !22, size: 32)
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !19, file: !18, line: 99, baseType: !22, size: 32, offset: 32)
!24 = !DILocation(line: 23, column: 21, scope: !11)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 24, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 50)
!29 = !DILocation(line: 24, column: 19, scope: !11)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 25, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 25, column: 19, scope: !11)
!35 = !DILocation(line: 26, column: 8, scope: !36)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 26, column: 8)
!37 = !DILocation(line: 26, column: 8, scope: !11)
!38 = !DILocation(line: 30, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !12, line: 27, column: 5)
!40 = !DILocation(line: 30, column: 14, scope: !39)
!41 = !DILocation(line: 31, column: 5, scope: !39)
!42 = !DILocation(line: 35, column: 16, scope: !43)
!43 = distinct !DILexicalBlock(scope: !36, file: !12, line: 33, column: 5)
!44 = !DILocation(line: 35, column: 14, scope: !43)
!45 = !DILocalVariable(name: "source", scope: !46, file: !12, line: 38, type: !31)
!46 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!47 = !DILocation(line: 38, column: 23, scope: !46)
!48 = !DILocalVariable(name: "i", scope: !49, file: !12, line: 40, type: !50)
!49 = distinct !DILexicalBlock(scope: !46, file: !12, line: 39, column: 9)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !51, line: 46, baseType: !52)
!51 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!52 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!53 = !DILocation(line: 40, column: 20, scope: !49)
!54 = !DILocation(line: 42, column: 20, scope: !55)
!55 = distinct !DILexicalBlock(scope: !49, file: !12, line: 42, column: 13)
!56 = !DILocation(line: 42, column: 18, scope: !55)
!57 = !DILocation(line: 42, column: 25, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !12, line: 42, column: 13)
!59 = !DILocation(line: 42, column: 27, scope: !58)
!60 = !DILocation(line: 42, column: 13, scope: !55)
!61 = !DILocation(line: 44, column: 24, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !12, line: 43, column: 13)
!63 = !DILocation(line: 44, column: 17, scope: !62)
!64 = !DILocation(line: 44, column: 27, scope: !62)
!65 = !DILocation(line: 44, column: 34, scope: !62)
!66 = !DILocation(line: 45, column: 24, scope: !62)
!67 = !DILocation(line: 45, column: 17, scope: !62)
!68 = !DILocation(line: 45, column: 27, scope: !62)
!69 = !DILocation(line: 45, column: 34, scope: !62)
!70 = !DILocation(line: 46, column: 13, scope: !62)
!71 = !DILocation(line: 42, column: 35, scope: !58)
!72 = !DILocation(line: 42, column: 13, scope: !58)
!73 = distinct !{!73, !60, !74, !75}
!74 = !DILocation(line: 46, column: 13, scope: !55)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocalVariable(name: "i", scope: !77, file: !12, line: 49, type: !50)
!77 = distinct !DILexicalBlock(scope: !46, file: !12, line: 48, column: 9)
!78 = !DILocation(line: 49, column: 20, scope: !77)
!79 = !DILocation(line: 51, column: 20, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !12, line: 51, column: 13)
!81 = !DILocation(line: 51, column: 18, scope: !80)
!82 = !DILocation(line: 51, column: 25, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !12, line: 51, column: 13)
!84 = !DILocation(line: 51, column: 27, scope: !83)
!85 = !DILocation(line: 51, column: 13, scope: !80)
!86 = !DILocation(line: 53, column: 17, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !12, line: 52, column: 13)
!88 = !DILocation(line: 53, column: 22, scope: !87)
!89 = !DILocation(line: 53, column: 34, scope: !87)
!90 = !DILocation(line: 53, column: 27, scope: !87)
!91 = !DILocation(line: 54, column: 13, scope: !87)
!92 = !DILocation(line: 51, column: 35, scope: !83)
!93 = !DILocation(line: 51, column: 13, scope: !83)
!94 = distinct !{!94, !85, !95, !75}
!95 = !DILocation(line: 54, column: 13, scope: !80)
!96 = !DILocation(line: 55, column: 30, scope: !77)
!97 = !DILocation(line: 55, column: 13, scope: !77)
!98 = !DILocation(line: 58, column: 1, scope: !11)
!99 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_12_good", scope: !12, file: !12, line: 104, type: !13, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocation(line: 106, column: 5, scope: !99)
!101 = !DILocation(line: 107, column: 1, scope: !99)
!102 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 119, type: !103, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DISubroutineType(types: !104)
!104 = !{!22, !22, !105}
!105 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !106, size: 64)
!106 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !107, size: 64)
!107 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!108 = !DILocalVariable(name: "argc", arg: 1, scope: !102, file: !12, line: 119, type: !22)
!109 = !DILocation(line: 119, column: 14, scope: !102)
!110 = !DILocalVariable(name: "argv", arg: 2, scope: !102, file: !12, line: 119, type: !105)
!111 = !DILocation(line: 119, column: 27, scope: !102)
!112 = !DILocation(line: 122, column: 22, scope: !102)
!113 = !DILocation(line: 122, column: 12, scope: !102)
!114 = !DILocation(line: 122, column: 5, scope: !102)
!115 = !DILocation(line: 124, column: 5, scope: !102)
!116 = !DILocation(line: 125, column: 5, scope: !102)
!117 = !DILocation(line: 126, column: 5, scope: !102)
!118 = !DILocation(line: 129, column: 5, scope: !102)
!119 = !DILocation(line: 130, column: 5, scope: !102)
!120 = !DILocation(line: 131, column: 5, scope: !102)
!121 = !DILocation(line: 133, column: 5, scope: !102)
!122 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 66, type: !13, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!123 = !DILocalVariable(name: "data", scope: !122, file: !12, line: 68, type: !16)
!124 = !DILocation(line: 68, column: 21, scope: !122)
!125 = !DILocalVariable(name: "dataBadBuffer", scope: !122, file: !12, line: 69, type: !26)
!126 = !DILocation(line: 69, column: 19, scope: !122)
!127 = !DILocalVariable(name: "dataGoodBuffer", scope: !122, file: !12, line: 70, type: !31)
!128 = !DILocation(line: 70, column: 19, scope: !122)
!129 = !DILocation(line: 71, column: 8, scope: !130)
!130 = distinct !DILexicalBlock(scope: !122, file: !12, line: 71, column: 8)
!131 = !DILocation(line: 71, column: 8, scope: !122)
!132 = !DILocation(line: 74, column: 16, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !12, line: 72, column: 5)
!134 = !DILocation(line: 74, column: 14, scope: !133)
!135 = !DILocation(line: 75, column: 5, scope: !133)
!136 = !DILocation(line: 79, column: 16, scope: !137)
!137 = distinct !DILexicalBlock(scope: !130, file: !12, line: 77, column: 5)
!138 = !DILocation(line: 79, column: 14, scope: !137)
!139 = !DILocalVariable(name: "source", scope: !140, file: !12, line: 82, type: !31)
!140 = distinct !DILexicalBlock(scope: !122, file: !12, line: 81, column: 5)
!141 = !DILocation(line: 82, column: 23, scope: !140)
!142 = !DILocalVariable(name: "i", scope: !143, file: !12, line: 84, type: !50)
!143 = distinct !DILexicalBlock(scope: !140, file: !12, line: 83, column: 9)
!144 = !DILocation(line: 84, column: 20, scope: !143)
!145 = !DILocation(line: 86, column: 20, scope: !146)
!146 = distinct !DILexicalBlock(scope: !143, file: !12, line: 86, column: 13)
!147 = !DILocation(line: 86, column: 18, scope: !146)
!148 = !DILocation(line: 86, column: 25, scope: !149)
!149 = distinct !DILexicalBlock(scope: !146, file: !12, line: 86, column: 13)
!150 = !DILocation(line: 86, column: 27, scope: !149)
!151 = !DILocation(line: 86, column: 13, scope: !146)
!152 = !DILocation(line: 88, column: 24, scope: !153)
!153 = distinct !DILexicalBlock(scope: !149, file: !12, line: 87, column: 13)
!154 = !DILocation(line: 88, column: 17, scope: !153)
!155 = !DILocation(line: 88, column: 27, scope: !153)
!156 = !DILocation(line: 88, column: 34, scope: !153)
!157 = !DILocation(line: 89, column: 24, scope: !153)
!158 = !DILocation(line: 89, column: 17, scope: !153)
!159 = !DILocation(line: 89, column: 27, scope: !153)
!160 = !DILocation(line: 89, column: 34, scope: !153)
!161 = !DILocation(line: 90, column: 13, scope: !153)
!162 = !DILocation(line: 86, column: 35, scope: !149)
!163 = !DILocation(line: 86, column: 13, scope: !149)
!164 = distinct !{!164, !151, !165, !75}
!165 = !DILocation(line: 90, column: 13, scope: !146)
!166 = !DILocalVariable(name: "i", scope: !167, file: !12, line: 93, type: !50)
!167 = distinct !DILexicalBlock(scope: !140, file: !12, line: 92, column: 9)
!168 = !DILocation(line: 93, column: 20, scope: !167)
!169 = !DILocation(line: 95, column: 20, scope: !170)
!170 = distinct !DILexicalBlock(scope: !167, file: !12, line: 95, column: 13)
!171 = !DILocation(line: 95, column: 18, scope: !170)
!172 = !DILocation(line: 95, column: 25, scope: !173)
!173 = distinct !DILexicalBlock(scope: !170, file: !12, line: 95, column: 13)
!174 = !DILocation(line: 95, column: 27, scope: !173)
!175 = !DILocation(line: 95, column: 13, scope: !170)
!176 = !DILocation(line: 97, column: 17, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !12, line: 96, column: 13)
!178 = !DILocation(line: 97, column: 22, scope: !177)
!179 = !DILocation(line: 97, column: 34, scope: !177)
!180 = !DILocation(line: 97, column: 27, scope: !177)
!181 = !DILocation(line: 98, column: 13, scope: !177)
!182 = !DILocation(line: 95, column: 35, scope: !173)
!183 = !DILocation(line: 95, column: 13, scope: !173)
!184 = distinct !{!184, !175, !185, !75}
!185 = !DILocation(line: 98, column: 13, scope: !170)
!186 = !DILocation(line: 99, column: 30, scope: !167)
!187 = !DILocation(line: 99, column: 13, scope: !167)
!188 = !DILocation(line: 102, column: 1, scope: !122)
