; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_41_badSink(%struct._twoIntsStruct* %data) #0 !dbg !11 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !25, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i64* %i, metadata !31, metadata !DIExpression()), !dbg !36
  store i64 0, i64* %i, align 8, !dbg !37
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !40
  %cmp = icmp ult i64 %0, 100, !dbg !42
  br i1 %cmp, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !44
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !46
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !47
  store i32 0, i32* %intOne, align 8, !dbg !48
  %2 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !50
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !51
  store i32 0, i32* %intTwo, align 4, !dbg !52
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !54
  %inc = add i64 %3, 1, !dbg !54
  store i64 %inc, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !55, !llvm.loop !56

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !59, metadata !DIExpression()), !dbg !61
  store i64 0, i64* %i2, align 8, !dbg !62
  br label %for.cond3, !dbg !64

for.cond3:                                        ; preds = %for.inc8, %for.end
  %4 = load i64, i64* %i2, align 8, !dbg !65
  %cmp4 = icmp ult i64 %4, 100, !dbg !67
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !68

for.body5:                                        ; preds = %for.cond3
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !69
  %6 = load i64, i64* %i2, align 8, !dbg !71
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !69
  %7 = load i64, i64* %i2, align 8, !dbg !72
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !73
  %8 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !73
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !73
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 8 %9, i64 8, i1 false), !dbg !73
  br label %for.inc8, !dbg !74

for.inc8:                                         ; preds = %for.body5
  %10 = load i64, i64* %i2, align 8, !dbg !75
  %inc9 = add i64 %10, 1, !dbg !75
  store i64 %inc9, i64* %i2, align 8, !dbg !75
  br label %for.cond3, !dbg !76, !llvm.loop !77

for.end10:                                        ; preds = %for.cond3
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !79
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !79
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_41_bad() #0 !dbg !82 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !87, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !94
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !95
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_41_badSink(%struct._twoIntsStruct* %0), !dbg !97
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_41_goodG2BSink(%struct._twoIntsStruct* %data) #0 !dbg !99 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !102, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata i64* %i, metadata !105, metadata !DIExpression()), !dbg !107
  store i64 0, i64* %i, align 8, !dbg !108
  br label %for.cond, !dbg !110

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !111
  %cmp = icmp ult i64 %0, 100, !dbg !113
  br i1 %cmp, label %for.body, label %for.end, !dbg !114

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !115
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !117
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !118
  store i32 0, i32* %intOne, align 8, !dbg !119
  %2 = load i64, i64* %i, align 8, !dbg !120
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !121
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !122
  store i32 0, i32* %intTwo, align 4, !dbg !123
  br label %for.inc, !dbg !124

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !125
  %inc = add i64 %3, 1, !dbg !125
  store i64 %inc, i64* %i, align 8, !dbg !125
  br label %for.cond, !dbg !126, !llvm.loop !127

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !129, metadata !DIExpression()), !dbg !131
  store i64 0, i64* %i2, align 8, !dbg !132
  br label %for.cond3, !dbg !134

for.cond3:                                        ; preds = %for.inc8, %for.end
  %4 = load i64, i64* %i2, align 8, !dbg !135
  %cmp4 = icmp ult i64 %4, 100, !dbg !137
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !138

for.body5:                                        ; preds = %for.cond3
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !139
  %6 = load i64, i64* %i2, align 8, !dbg !141
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !139
  %7 = load i64, i64* %i2, align 8, !dbg !142
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !143
  %8 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !143
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !143
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 8 %9, i64 8, i1 false), !dbg !143
  br label %for.inc8, !dbg !144

for.inc8:                                         ; preds = %for.body5
  %10 = load i64, i64* %i2, align 8, !dbg !145
  %inc9 = add i64 %10, 1, !dbg !145
  store i64 %inc9, i64* %i2, align 8, !dbg !145
  br label %for.cond3, !dbg !146, !llvm.loop !147

for.end10:                                        ; preds = %for.cond3
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !149
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !149
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !150
  ret void, !dbg !151
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_41_good() #0 !dbg !152 {
entry:
  call void @goodG2B(), !dbg !153
  ret void, !dbg !154
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !155 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !161, metadata !DIExpression()), !dbg !162
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !163, metadata !DIExpression()), !dbg !164
  %call = call i64 @time(i64* null) #5, !dbg !165
  %conv = trunc i64 %call to i32, !dbg !166
  call void @srand(i32 %conv) #5, !dbg !167
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !168
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_41_good(), !dbg !169
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !170
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !171
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_41_bad(), !dbg !172
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !173
  ret i32 0, !dbg !174
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !175 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !176, metadata !DIExpression()), !dbg !177
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !178, metadata !DIExpression()), !dbg !179
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !180, metadata !DIExpression()), !dbg !181
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !182
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !183
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !184
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_41_goodG2BSink(%struct._twoIntsStruct* %0), !dbg !185
  ret void, !dbg !186
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_41_badSink", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !17, line: 100, baseType: !18)
!17 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!18 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !17, line: 96, size: 64, elements: !19)
!19 = !{!20, !22}
!20 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !18, file: !17, line: 98, baseType: !21, size: 32)
!21 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !18, file: !17, line: 99, baseType: !21, size: 32, offset: 32)
!23 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 21, type: !15)
!24 = !DILocation(line: 21, column: 96, scope: !11)
!25 = !DILocalVariable(name: "source", scope: !26, file: !12, line: 24, type: !27)
!26 = distinct !DILexicalBlock(scope: !11, file: !12, line: 23, column: 5)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 6400, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 24, column: 23, scope: !26)
!31 = !DILocalVariable(name: "i", scope: !32, file: !12, line: 26, type: !33)
!32 = distinct !DILexicalBlock(scope: !26, file: !12, line: 25, column: 9)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !34, line: 46, baseType: !35)
!34 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!35 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!36 = !DILocation(line: 26, column: 20, scope: !32)
!37 = !DILocation(line: 28, column: 20, scope: !38)
!38 = distinct !DILexicalBlock(scope: !32, file: !12, line: 28, column: 13)
!39 = !DILocation(line: 28, column: 18, scope: !38)
!40 = !DILocation(line: 28, column: 25, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !12, line: 28, column: 13)
!42 = !DILocation(line: 28, column: 27, scope: !41)
!43 = !DILocation(line: 28, column: 13, scope: !38)
!44 = !DILocation(line: 30, column: 24, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !12, line: 29, column: 13)
!46 = !DILocation(line: 30, column: 17, scope: !45)
!47 = !DILocation(line: 30, column: 27, scope: !45)
!48 = !DILocation(line: 30, column: 34, scope: !45)
!49 = !DILocation(line: 31, column: 24, scope: !45)
!50 = !DILocation(line: 31, column: 17, scope: !45)
!51 = !DILocation(line: 31, column: 27, scope: !45)
!52 = !DILocation(line: 31, column: 34, scope: !45)
!53 = !DILocation(line: 32, column: 13, scope: !45)
!54 = !DILocation(line: 28, column: 35, scope: !41)
!55 = !DILocation(line: 28, column: 13, scope: !41)
!56 = distinct !{!56, !43, !57, !58}
!57 = !DILocation(line: 32, column: 13, scope: !38)
!58 = !{!"llvm.loop.mustprogress"}
!59 = !DILocalVariable(name: "i", scope: !60, file: !12, line: 35, type: !33)
!60 = distinct !DILexicalBlock(scope: !26, file: !12, line: 34, column: 9)
!61 = !DILocation(line: 35, column: 20, scope: !60)
!62 = !DILocation(line: 37, column: 20, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !12, line: 37, column: 13)
!64 = !DILocation(line: 37, column: 18, scope: !63)
!65 = !DILocation(line: 37, column: 25, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !12, line: 37, column: 13)
!67 = !DILocation(line: 37, column: 27, scope: !66)
!68 = !DILocation(line: 37, column: 13, scope: !63)
!69 = !DILocation(line: 39, column: 17, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !12, line: 38, column: 13)
!71 = !DILocation(line: 39, column: 22, scope: !70)
!72 = !DILocation(line: 39, column: 34, scope: !70)
!73 = !DILocation(line: 39, column: 27, scope: !70)
!74 = !DILocation(line: 40, column: 13, scope: !70)
!75 = !DILocation(line: 37, column: 35, scope: !66)
!76 = !DILocation(line: 37, column: 13, scope: !66)
!77 = distinct !{!77, !68, !78, !58}
!78 = !DILocation(line: 40, column: 13, scope: !63)
!79 = !DILocation(line: 41, column: 30, scope: !60)
!80 = !DILocation(line: 41, column: 13, scope: !60)
!81 = !DILocation(line: 44, column: 1, scope: !11)
!82 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_41_bad", scope: !12, file: !12, line: 46, type: !83, scopeLine: 47, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DISubroutineType(types: !84)
!84 = !{null}
!85 = !DILocalVariable(name: "data", scope: !82, file: !12, line: 48, type: !15)
!86 = !DILocation(line: 48, column: 21, scope: !82)
!87 = !DILocalVariable(name: "dataBadBuffer", scope: !82, file: !12, line: 49, type: !88)
!88 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 3200, elements: !89)
!89 = !{!90}
!90 = !DISubrange(count: 50)
!91 = !DILocation(line: 49, column: 19, scope: !82)
!92 = !DILocalVariable(name: "dataGoodBuffer", scope: !82, file: !12, line: 50, type: !27)
!93 = !DILocation(line: 50, column: 19, scope: !82)
!94 = !DILocation(line: 53, column: 12, scope: !82)
!95 = !DILocation(line: 53, column: 10, scope: !82)
!96 = !DILocation(line: 54, column: 79, scope: !82)
!97 = !DILocation(line: 54, column: 5, scope: !82)
!98 = !DILocation(line: 55, column: 1, scope: !82)
!99 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_41_goodG2BSink", scope: !12, file: !12, line: 61, type: !13, scopeLine: 62, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", arg: 1, scope: !99, file: !12, line: 61, type: !15)
!101 = !DILocation(line: 61, column: 100, scope: !99)
!102 = !DILocalVariable(name: "source", scope: !103, file: !12, line: 64, type: !27)
!103 = distinct !DILexicalBlock(scope: !99, file: !12, line: 63, column: 5)
!104 = !DILocation(line: 64, column: 23, scope: !103)
!105 = !DILocalVariable(name: "i", scope: !106, file: !12, line: 66, type: !33)
!106 = distinct !DILexicalBlock(scope: !103, file: !12, line: 65, column: 9)
!107 = !DILocation(line: 66, column: 20, scope: !106)
!108 = !DILocation(line: 68, column: 20, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !12, line: 68, column: 13)
!110 = !DILocation(line: 68, column: 18, scope: !109)
!111 = !DILocation(line: 68, column: 25, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !12, line: 68, column: 13)
!113 = !DILocation(line: 68, column: 27, scope: !112)
!114 = !DILocation(line: 68, column: 13, scope: !109)
!115 = !DILocation(line: 70, column: 24, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !12, line: 69, column: 13)
!117 = !DILocation(line: 70, column: 17, scope: !116)
!118 = !DILocation(line: 70, column: 27, scope: !116)
!119 = !DILocation(line: 70, column: 34, scope: !116)
!120 = !DILocation(line: 71, column: 24, scope: !116)
!121 = !DILocation(line: 71, column: 17, scope: !116)
!122 = !DILocation(line: 71, column: 27, scope: !116)
!123 = !DILocation(line: 71, column: 34, scope: !116)
!124 = !DILocation(line: 72, column: 13, scope: !116)
!125 = !DILocation(line: 68, column: 35, scope: !112)
!126 = !DILocation(line: 68, column: 13, scope: !112)
!127 = distinct !{!127, !114, !128, !58}
!128 = !DILocation(line: 72, column: 13, scope: !109)
!129 = !DILocalVariable(name: "i", scope: !130, file: !12, line: 75, type: !33)
!130 = distinct !DILexicalBlock(scope: !103, file: !12, line: 74, column: 9)
!131 = !DILocation(line: 75, column: 20, scope: !130)
!132 = !DILocation(line: 77, column: 20, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !12, line: 77, column: 13)
!134 = !DILocation(line: 77, column: 18, scope: !133)
!135 = !DILocation(line: 77, column: 25, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !12, line: 77, column: 13)
!137 = !DILocation(line: 77, column: 27, scope: !136)
!138 = !DILocation(line: 77, column: 13, scope: !133)
!139 = !DILocation(line: 79, column: 17, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !12, line: 78, column: 13)
!141 = !DILocation(line: 79, column: 22, scope: !140)
!142 = !DILocation(line: 79, column: 34, scope: !140)
!143 = !DILocation(line: 79, column: 27, scope: !140)
!144 = !DILocation(line: 80, column: 13, scope: !140)
!145 = !DILocation(line: 77, column: 35, scope: !136)
!146 = !DILocation(line: 77, column: 13, scope: !136)
!147 = distinct !{!147, !138, !148, !58}
!148 = !DILocation(line: 80, column: 13, scope: !133)
!149 = !DILocation(line: 81, column: 30, scope: !130)
!150 = !DILocation(line: 81, column: 13, scope: !130)
!151 = !DILocation(line: 84, column: 1, scope: !99)
!152 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_41_good", scope: !12, file: !12, line: 97, type: !83, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!153 = !DILocation(line: 99, column: 5, scope: !152)
!154 = !DILocation(line: 100, column: 1, scope: !152)
!155 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 112, type: !156, scopeLine: 113, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!156 = !DISubroutineType(types: !157)
!157 = !{!21, !21, !158}
!158 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !159, size: 64)
!159 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !160, size: 64)
!160 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!161 = !DILocalVariable(name: "argc", arg: 1, scope: !155, file: !12, line: 112, type: !21)
!162 = !DILocation(line: 112, column: 14, scope: !155)
!163 = !DILocalVariable(name: "argv", arg: 2, scope: !155, file: !12, line: 112, type: !158)
!164 = !DILocation(line: 112, column: 27, scope: !155)
!165 = !DILocation(line: 115, column: 22, scope: !155)
!166 = !DILocation(line: 115, column: 12, scope: !155)
!167 = !DILocation(line: 115, column: 5, scope: !155)
!168 = !DILocation(line: 117, column: 5, scope: !155)
!169 = !DILocation(line: 118, column: 5, scope: !155)
!170 = !DILocation(line: 119, column: 5, scope: !155)
!171 = !DILocation(line: 122, column: 5, scope: !155)
!172 = !DILocation(line: 123, column: 5, scope: !155)
!173 = !DILocation(line: 124, column: 5, scope: !155)
!174 = !DILocation(line: 126, column: 5, scope: !155)
!175 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 87, type: !83, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!176 = !DILocalVariable(name: "data", scope: !175, file: !12, line: 89, type: !15)
!177 = !DILocation(line: 89, column: 21, scope: !175)
!178 = !DILocalVariable(name: "dataBadBuffer", scope: !175, file: !12, line: 90, type: !88)
!179 = !DILocation(line: 90, column: 19, scope: !175)
!180 = !DILocalVariable(name: "dataGoodBuffer", scope: !175, file: !12, line: 91, type: !27)
!181 = !DILocation(line: 91, column: 19, scope: !175)
!182 = !DILocation(line: 93, column: 12, scope: !175)
!183 = !DILocation(line: 93, column: 10, scope: !175)
!184 = !DILocation(line: 94, column: 83, scope: !175)
!185 = !DILocation(line: 94, column: 5, scope: !175)
!186 = !DILocation(line: 95, column: 1, scope: !175)
