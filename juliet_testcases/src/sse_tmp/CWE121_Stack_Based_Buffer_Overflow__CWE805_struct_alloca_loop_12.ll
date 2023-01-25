; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_12_bad() #0 !dbg !19 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 400, align 16, !dbg !27
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !28
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !30
  %2 = alloca i8, i64 800, align 16, !dbg !31
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !32
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !30
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !33
  %tobool = icmp ne i32 %call, 0, !dbg !33
  br i1 %tobool, label %if.then, label %if.else, !dbg !35

if.then:                                          ; preds = %entry
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !36
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !38
  br label %if.end, !dbg !39

if.else:                                          ; preds = %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !40
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data, align 8, !dbg !42
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !43, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %i, metadata !49, metadata !DIExpression()), !dbg !54
  store i64 0, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !58
  %cmp = icmp ult i64 %6, 100, !dbg !60
  br i1 %cmp, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !64
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !65
  store i32 0, i32* %intOne, align 8, !dbg !66
  %8 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !68
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !69
  store i32 0, i32* %intTwo, align 4, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %9, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !77, metadata !DIExpression()), !dbg !79
  store i64 0, i64* %i2, align 8, !dbg !80
  br label %for.cond3, !dbg !82

for.cond3:                                        ; preds = %for.inc8, %for.end
  %10 = load i64, i64* %i2, align 8, !dbg !83
  %cmp4 = icmp ult i64 %10, 100, !dbg !85
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !86

for.body5:                                        ; preds = %for.cond3
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !87
  %12 = load i64, i64* %i2, align 8, !dbg !89
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 %12, !dbg !87
  %13 = load i64, i64* %i2, align 8, !dbg !90
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %13, !dbg !91
  %14 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !91
  %15 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !91
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %14, i8* align 8 %15, i64 8, i1 false), !dbg !91
  br label %for.inc8, !dbg !92

for.inc8:                                         ; preds = %for.body5
  %16 = load i64, i64* %i2, align 8, !dbg !93
  %inc9 = add i64 %16, 1, !dbg !93
  store i64 %inc9, i64* %i2, align 8, !dbg !93
  br label %for.cond3, !dbg !94, !llvm.loop !95

for.end10:                                        ; preds = %for.cond3
  %17 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !97
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %17, i64 0, !dbg !97
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_12_good() #0 !dbg !100 {
entry:
  call void @goodG2B(), !dbg !101
  ret void, !dbg !102
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !103 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !109, metadata !DIExpression()), !dbg !110
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !111, metadata !DIExpression()), !dbg !112
  %call = call i64 @time(i64* null) #5, !dbg !113
  %conv = trunc i64 %call to i32, !dbg !114
  call void @srand(i32 %conv) #5, !dbg !115
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !116
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_12_good(), !dbg !117
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !118
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !119
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_12_bad(), !dbg !120
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !121
  ret i32 0, !dbg !122
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !123 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !126, metadata !DIExpression()), !dbg !127
  %0 = alloca i8, i64 400, align 16, !dbg !128
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !129
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !130, metadata !DIExpression()), !dbg !131
  %2 = alloca i8, i64 800, align 16, !dbg !132
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !133
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !131
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !134
  %tobool = icmp ne i32 %call, 0, !dbg !134
  br i1 %tobool, label %if.then, label %if.else, !dbg !136

if.then:                                          ; preds = %entry
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !137
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !139
  br label %if.end, !dbg !140

if.else:                                          ; preds = %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !141
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data, align 8, !dbg !143
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !144, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata i64* %i, metadata !147, metadata !DIExpression()), !dbg !149
  store i64 0, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !152

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !153
  %cmp = icmp ult i64 %6, 100, !dbg !155
  br i1 %cmp, label %for.body, label %for.end, !dbg !156

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !159
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !160
  store i32 0, i32* %intOne, align 8, !dbg !161
  %8 = load i64, i64* %i, align 8, !dbg !162
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !163
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !164
  store i32 0, i32* %intTwo, align 4, !dbg !165
  br label %for.inc, !dbg !166

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !167
  %inc = add i64 %9, 1, !dbg !167
  store i64 %inc, i64* %i, align 8, !dbg !167
  br label %for.cond, !dbg !168, !llvm.loop !169

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !171, metadata !DIExpression()), !dbg !173
  store i64 0, i64* %i2, align 8, !dbg !174
  br label %for.cond3, !dbg !176

for.cond3:                                        ; preds = %for.inc8, %for.end
  %10 = load i64, i64* %i2, align 8, !dbg !177
  %cmp4 = icmp ult i64 %10, 100, !dbg !179
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !180

for.body5:                                        ; preds = %for.cond3
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !181
  %12 = load i64, i64* %i2, align 8, !dbg !183
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 %12, !dbg !181
  %13 = load i64, i64* %i2, align 8, !dbg !184
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %13, !dbg !185
  %14 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !185
  %15 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !185
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %14, i8* align 8 %15, i64 8, i1 false), !dbg !185
  br label %for.inc8, !dbg !186

for.inc8:                                         ; preds = %for.body5
  %16 = load i64, i64* %i2, align 8, !dbg !187
  %inc9 = add i64 %16, 1, !dbg !187
  store i64 %inc9, i64* %i2, align 8, !dbg !187
  br label %for.cond3, !dbg !188, !llvm.loop !189

for.end10:                                        ; preds = %for.cond3
  %17 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !191
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %17, i64 0, !dbg !191
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !192
  ret void, !dbg !193
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_12.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !12}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !6, line: 100, baseType: !7)
!6 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !6, line: 96, size: 64, elements: !8)
!8 = !{!9, !11}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !7, file: !6, line: 98, baseType: !10, size: 32)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !7, file: !6, line: 99, baseType: !10, size: 32, offset: 32)
!12 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_12_bad", scope: !20, file: !20, line: 21, type: !21, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_12.c", directory: "/home/joelyang/SSE-Assessment")
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !19, file: !20, line: 23, type: !4)
!24 = !DILocation(line: 23, column: 21, scope: !19)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !20, line: 24, type: !4)
!26 = !DILocation(line: 24, column: 21, scope: !19)
!27 = !DILocation(line: 24, column: 54, scope: !19)
!28 = !DILocation(line: 24, column: 37, scope: !19)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !20, line: 25, type: !4)
!30 = !DILocation(line: 25, column: 21, scope: !19)
!31 = !DILocation(line: 25, column: 55, scope: !19)
!32 = !DILocation(line: 25, column: 38, scope: !19)
!33 = !DILocation(line: 26, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !19, file: !20, line: 26, column: 8)
!35 = !DILocation(line: 26, column: 8, scope: !19)
!36 = !DILocation(line: 30, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !20, line: 27, column: 5)
!38 = !DILocation(line: 30, column: 14, scope: !37)
!39 = !DILocation(line: 31, column: 5, scope: !37)
!40 = !DILocation(line: 35, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !34, file: !20, line: 33, column: 5)
!42 = !DILocation(line: 35, column: 14, scope: !41)
!43 = !DILocalVariable(name: "source", scope: !44, file: !20, line: 38, type: !45)
!44 = distinct !DILexicalBlock(scope: !19, file: !20, line: 37, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 100)
!48 = !DILocation(line: 38, column: 23, scope: !44)
!49 = !DILocalVariable(name: "i", scope: !50, file: !20, line: 40, type: !51)
!50 = distinct !DILexicalBlock(scope: !44, file: !20, line: 39, column: 9)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !52, line: 46, baseType: !53)
!52 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!53 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!54 = !DILocation(line: 40, column: 20, scope: !50)
!55 = !DILocation(line: 42, column: 20, scope: !56)
!56 = distinct !DILexicalBlock(scope: !50, file: !20, line: 42, column: 13)
!57 = !DILocation(line: 42, column: 18, scope: !56)
!58 = !DILocation(line: 42, column: 25, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !20, line: 42, column: 13)
!60 = !DILocation(line: 42, column: 27, scope: !59)
!61 = !DILocation(line: 42, column: 13, scope: !56)
!62 = !DILocation(line: 44, column: 24, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !20, line: 43, column: 13)
!64 = !DILocation(line: 44, column: 17, scope: !63)
!65 = !DILocation(line: 44, column: 27, scope: !63)
!66 = !DILocation(line: 44, column: 34, scope: !63)
!67 = !DILocation(line: 45, column: 24, scope: !63)
!68 = !DILocation(line: 45, column: 17, scope: !63)
!69 = !DILocation(line: 45, column: 27, scope: !63)
!70 = !DILocation(line: 45, column: 34, scope: !63)
!71 = !DILocation(line: 46, column: 13, scope: !63)
!72 = !DILocation(line: 42, column: 35, scope: !59)
!73 = !DILocation(line: 42, column: 13, scope: !59)
!74 = distinct !{!74, !61, !75, !76}
!75 = !DILocation(line: 46, column: 13, scope: !56)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocalVariable(name: "i", scope: !78, file: !20, line: 49, type: !51)
!78 = distinct !DILexicalBlock(scope: !44, file: !20, line: 48, column: 9)
!79 = !DILocation(line: 49, column: 20, scope: !78)
!80 = !DILocation(line: 51, column: 20, scope: !81)
!81 = distinct !DILexicalBlock(scope: !78, file: !20, line: 51, column: 13)
!82 = !DILocation(line: 51, column: 18, scope: !81)
!83 = !DILocation(line: 51, column: 25, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !20, line: 51, column: 13)
!85 = !DILocation(line: 51, column: 27, scope: !84)
!86 = !DILocation(line: 51, column: 13, scope: !81)
!87 = !DILocation(line: 53, column: 17, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !20, line: 52, column: 13)
!89 = !DILocation(line: 53, column: 22, scope: !88)
!90 = !DILocation(line: 53, column: 34, scope: !88)
!91 = !DILocation(line: 53, column: 27, scope: !88)
!92 = !DILocation(line: 54, column: 13, scope: !88)
!93 = !DILocation(line: 51, column: 35, scope: !84)
!94 = !DILocation(line: 51, column: 13, scope: !84)
!95 = distinct !{!95, !86, !96, !76}
!96 = !DILocation(line: 54, column: 13, scope: !81)
!97 = !DILocation(line: 55, column: 30, scope: !78)
!98 = !DILocation(line: 55, column: 13, scope: !78)
!99 = !DILocation(line: 58, column: 1, scope: !19)
!100 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_12_good", scope: !20, file: !20, line: 104, type: !21, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocation(line: 106, column: 5, scope: !100)
!102 = !DILocation(line: 107, column: 1, scope: !100)
!103 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 119, type: !104, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DISubroutineType(types: !105)
!105 = !{!10, !10, !106}
!106 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !107, size: 64)
!107 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !108, size: 64)
!108 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!109 = !DILocalVariable(name: "argc", arg: 1, scope: !103, file: !20, line: 119, type: !10)
!110 = !DILocation(line: 119, column: 14, scope: !103)
!111 = !DILocalVariable(name: "argv", arg: 2, scope: !103, file: !20, line: 119, type: !106)
!112 = !DILocation(line: 119, column: 27, scope: !103)
!113 = !DILocation(line: 122, column: 22, scope: !103)
!114 = !DILocation(line: 122, column: 12, scope: !103)
!115 = !DILocation(line: 122, column: 5, scope: !103)
!116 = !DILocation(line: 124, column: 5, scope: !103)
!117 = !DILocation(line: 125, column: 5, scope: !103)
!118 = !DILocation(line: 126, column: 5, scope: !103)
!119 = !DILocation(line: 129, column: 5, scope: !103)
!120 = !DILocation(line: 130, column: 5, scope: !103)
!121 = !DILocation(line: 131, column: 5, scope: !103)
!122 = !DILocation(line: 133, column: 5, scope: !103)
!123 = distinct !DISubprogram(name: "goodG2B", scope: !20, file: !20, line: 66, type: !21, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!124 = !DILocalVariable(name: "data", scope: !123, file: !20, line: 68, type: !4)
!125 = !DILocation(line: 68, column: 21, scope: !123)
!126 = !DILocalVariable(name: "dataBadBuffer", scope: !123, file: !20, line: 69, type: !4)
!127 = !DILocation(line: 69, column: 21, scope: !123)
!128 = !DILocation(line: 69, column: 54, scope: !123)
!129 = !DILocation(line: 69, column: 37, scope: !123)
!130 = !DILocalVariable(name: "dataGoodBuffer", scope: !123, file: !20, line: 70, type: !4)
!131 = !DILocation(line: 70, column: 21, scope: !123)
!132 = !DILocation(line: 70, column: 55, scope: !123)
!133 = !DILocation(line: 70, column: 38, scope: !123)
!134 = !DILocation(line: 71, column: 8, scope: !135)
!135 = distinct !DILexicalBlock(scope: !123, file: !20, line: 71, column: 8)
!136 = !DILocation(line: 71, column: 8, scope: !123)
!137 = !DILocation(line: 74, column: 16, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !20, line: 72, column: 5)
!139 = !DILocation(line: 74, column: 14, scope: !138)
!140 = !DILocation(line: 75, column: 5, scope: !138)
!141 = !DILocation(line: 79, column: 16, scope: !142)
!142 = distinct !DILexicalBlock(scope: !135, file: !20, line: 77, column: 5)
!143 = !DILocation(line: 79, column: 14, scope: !142)
!144 = !DILocalVariable(name: "source", scope: !145, file: !20, line: 82, type: !45)
!145 = distinct !DILexicalBlock(scope: !123, file: !20, line: 81, column: 5)
!146 = !DILocation(line: 82, column: 23, scope: !145)
!147 = !DILocalVariable(name: "i", scope: !148, file: !20, line: 84, type: !51)
!148 = distinct !DILexicalBlock(scope: !145, file: !20, line: 83, column: 9)
!149 = !DILocation(line: 84, column: 20, scope: !148)
!150 = !DILocation(line: 86, column: 20, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !20, line: 86, column: 13)
!152 = !DILocation(line: 86, column: 18, scope: !151)
!153 = !DILocation(line: 86, column: 25, scope: !154)
!154 = distinct !DILexicalBlock(scope: !151, file: !20, line: 86, column: 13)
!155 = !DILocation(line: 86, column: 27, scope: !154)
!156 = !DILocation(line: 86, column: 13, scope: !151)
!157 = !DILocation(line: 88, column: 24, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !20, line: 87, column: 13)
!159 = !DILocation(line: 88, column: 17, scope: !158)
!160 = !DILocation(line: 88, column: 27, scope: !158)
!161 = !DILocation(line: 88, column: 34, scope: !158)
!162 = !DILocation(line: 89, column: 24, scope: !158)
!163 = !DILocation(line: 89, column: 17, scope: !158)
!164 = !DILocation(line: 89, column: 27, scope: !158)
!165 = !DILocation(line: 89, column: 34, scope: !158)
!166 = !DILocation(line: 90, column: 13, scope: !158)
!167 = !DILocation(line: 86, column: 35, scope: !154)
!168 = !DILocation(line: 86, column: 13, scope: !154)
!169 = distinct !{!169, !156, !170, !76}
!170 = !DILocation(line: 90, column: 13, scope: !151)
!171 = !DILocalVariable(name: "i", scope: !172, file: !20, line: 93, type: !51)
!172 = distinct !DILexicalBlock(scope: !145, file: !20, line: 92, column: 9)
!173 = !DILocation(line: 93, column: 20, scope: !172)
!174 = !DILocation(line: 95, column: 20, scope: !175)
!175 = distinct !DILexicalBlock(scope: !172, file: !20, line: 95, column: 13)
!176 = !DILocation(line: 95, column: 18, scope: !175)
!177 = !DILocation(line: 95, column: 25, scope: !178)
!178 = distinct !DILexicalBlock(scope: !175, file: !20, line: 95, column: 13)
!179 = !DILocation(line: 95, column: 27, scope: !178)
!180 = !DILocation(line: 95, column: 13, scope: !175)
!181 = !DILocation(line: 97, column: 17, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !20, line: 96, column: 13)
!183 = !DILocation(line: 97, column: 22, scope: !182)
!184 = !DILocation(line: 97, column: 34, scope: !182)
!185 = !DILocation(line: 97, column: 27, scope: !182)
!186 = !DILocation(line: 98, column: 13, scope: !182)
!187 = !DILocation(line: 95, column: 35, scope: !178)
!188 = !DILocation(line: 95, column: 13, scope: !178)
!189 = distinct !{!189, !180, !190, !76}
!190 = !DILocation(line: 98, column: 13, scope: !175)
!191 = !DILocation(line: 99, column: 30, scope: !172)
!192 = !DILocation(line: 99, column: 13, scope: !172)
!193 = !DILocation(line: 102, column: 1, scope: !123)
