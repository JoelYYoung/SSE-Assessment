; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_17_bad() #0 !dbg !11 {
entry:
  %i = alloca i32, align 4
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i1 = alloca i64, align 8
  %i9 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !18, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !27, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !32, metadata !DIExpression()), !dbg !36
  store i32 0, i32* %i, align 4, !dbg !37
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !40
  %cmp = icmp slt i32 %0, 1, !dbg !42
  br i1 %cmp, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !44
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !46
  br label %for.inc, !dbg !47

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %i, align 4, !dbg !48
  %inc = add nsw i32 %1, 1, !dbg !48
  store i32 %inc, i32* %i, align 4, !dbg !48
  br label %for.cond, !dbg !49, !llvm.loop !50

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !53, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i64* %i1, metadata !56, metadata !DIExpression()), !dbg !61
  store i64 0, i64* %i1, align 8, !dbg !62
  br label %for.cond2, !dbg !64

for.cond2:                                        ; preds = %for.inc6, %for.end
  %2 = load i64, i64* %i1, align 8, !dbg !65
  %cmp3 = icmp ult i64 %2, 100, !dbg !67
  br i1 %cmp3, label %for.body4, label %for.end8, !dbg !68

for.body4:                                        ; preds = %for.cond2
  %3 = load i64, i64* %i1, align 8, !dbg !69
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !71
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !72
  store i32 0, i32* %intOne, align 8, !dbg !73
  %4 = load i64, i64* %i1, align 8, !dbg !74
  %arrayidx5 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !75
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx5, i32 0, i32 1, !dbg !76
  store i32 0, i32* %intTwo, align 4, !dbg !77
  br label %for.inc6, !dbg !78

for.inc6:                                         ; preds = %for.body4
  %5 = load i64, i64* %i1, align 8, !dbg !79
  %inc7 = add i64 %5, 1, !dbg !79
  store i64 %inc7, i64* %i1, align 8, !dbg !79
  br label %for.cond2, !dbg !80, !llvm.loop !81

for.end8:                                         ; preds = %for.cond2
  call void @llvm.dbg.declare(metadata i64* %i9, metadata !83, metadata !DIExpression()), !dbg !85
  store i64 0, i64* %i9, align 8, !dbg !86
  br label %for.cond10, !dbg !88

for.cond10:                                       ; preds = %for.inc15, %for.end8
  %6 = load i64, i64* %i9, align 8, !dbg !89
  %cmp11 = icmp ult i64 %6, 100, !dbg !91
  br i1 %cmp11, label %for.body12, label %for.end17, !dbg !92

for.body12:                                       ; preds = %for.cond10
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !93
  %8 = load i64, i64* %i9, align 8, !dbg !95
  %arrayidx13 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 %8, !dbg !93
  %9 = load i64, i64* %i9, align 8, !dbg !96
  %arrayidx14 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !97
  %10 = bitcast %struct._twoIntsStruct* %arrayidx13 to i8*, !dbg !97
  %11 = bitcast %struct._twoIntsStruct* %arrayidx14 to i8*, !dbg !97
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %10, i8* align 8 %11, i64 8, i1 false), !dbg !97
  br label %for.inc15, !dbg !98

for.inc15:                                        ; preds = %for.body12
  %12 = load i64, i64* %i9, align 8, !dbg !99
  %inc16 = add i64 %12, 1, !dbg !99
  store i64 %inc16, i64* %i9, align 8, !dbg !99
  br label %for.cond10, !dbg !100, !llvm.loop !101

for.end17:                                        ; preds = %for.cond10
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !103
  %arrayidx18 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !103
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx18), !dbg !104
  ret void, !dbg !105
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_17_good() #0 !dbg !106 {
entry:
  call void @goodG2B(), !dbg !107
  ret void, !dbg !108
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !109 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !115, metadata !DIExpression()), !dbg !116
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !117, metadata !DIExpression()), !dbg !118
  %call = call i64 @time(i64* null) #5, !dbg !119
  %conv = trunc i64 %call to i32, !dbg !120
  call void @srand(i32 %conv) #5, !dbg !121
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !122
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_17_good(), !dbg !123
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !124
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !125
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_17_bad(), !dbg !126
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !127
  ret i32 0, !dbg !128
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !129 {
entry:
  %h = alloca i32, align 4
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i8 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !130, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !132, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !134, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !136, metadata !DIExpression()), !dbg !137
  store i32 0, i32* %h, align 4, !dbg !138
  br label %for.cond, !dbg !140

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !141
  %cmp = icmp slt i32 %0, 1, !dbg !143
  br i1 %cmp, label %for.body, label %for.end, !dbg !144

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !145
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !147
  br label %for.inc, !dbg !148

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %h, align 4, !dbg !149
  %inc = add nsw i32 %1, 1, !dbg !149
  store i32 %inc, i32* %h, align 4, !dbg !149
  br label %for.cond, !dbg !150, !llvm.loop !151

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !153, metadata !DIExpression()), !dbg !155
  call void @llvm.dbg.declare(metadata i64* %i, metadata !156, metadata !DIExpression()), !dbg !158
  store i64 0, i64* %i, align 8, !dbg !159
  br label %for.cond1, !dbg !161

for.cond1:                                        ; preds = %for.inc5, %for.end
  %2 = load i64, i64* %i, align 8, !dbg !162
  %cmp2 = icmp ult i64 %2, 100, !dbg !164
  br i1 %cmp2, label %for.body3, label %for.end7, !dbg !165

for.body3:                                        ; preds = %for.cond1
  %3 = load i64, i64* %i, align 8, !dbg !166
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !168
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !169
  store i32 0, i32* %intOne, align 8, !dbg !170
  %4 = load i64, i64* %i, align 8, !dbg !171
  %arrayidx4 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !172
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !173
  store i32 0, i32* %intTwo, align 4, !dbg !174
  br label %for.inc5, !dbg !175

for.inc5:                                         ; preds = %for.body3
  %5 = load i64, i64* %i, align 8, !dbg !176
  %inc6 = add i64 %5, 1, !dbg !176
  store i64 %inc6, i64* %i, align 8, !dbg !176
  br label %for.cond1, !dbg !177, !llvm.loop !178

for.end7:                                         ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata i64* %i8, metadata !180, metadata !DIExpression()), !dbg !182
  store i64 0, i64* %i8, align 8, !dbg !183
  br label %for.cond9, !dbg !185

for.cond9:                                        ; preds = %for.inc14, %for.end7
  %6 = load i64, i64* %i8, align 8, !dbg !186
  %cmp10 = icmp ult i64 %6, 100, !dbg !188
  br i1 %cmp10, label %for.body11, label %for.end16, !dbg !189

for.body11:                                       ; preds = %for.cond9
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !190
  %8 = load i64, i64* %i8, align 8, !dbg !192
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 %8, !dbg !190
  %9 = load i64, i64* %i8, align 8, !dbg !193
  %arrayidx13 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !194
  %10 = bitcast %struct._twoIntsStruct* %arrayidx12 to i8*, !dbg !194
  %11 = bitcast %struct._twoIntsStruct* %arrayidx13 to i8*, !dbg !194
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %10, i8* align 8 %11, i64 8, i1 false), !dbg !194
  br label %for.inc14, !dbg !195

for.inc14:                                        ; preds = %for.body11
  %12 = load i64, i64* %i8, align 8, !dbg !196
  %inc15 = add i64 %12, 1, !dbg !196
  store i64 %inc15, i64* %i8, align 8, !dbg !196
  br label %for.cond9, !dbg !197, !llvm.loop !198

for.end16:                                        ; preds = %for.cond9
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !200
  %arrayidx17 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !200
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx17), !dbg !201
  ret void, !dbg !202
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_17.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_17_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_17.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "i", scope: !11, file: !12, line: 23, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 23, column: 9, scope: !11)
!18 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !21, line: 100, baseType: !22)
!21 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/root/SSE-Assessment")
!22 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !21, line: 96, size: 64, elements: !23)
!23 = !{!24, !25}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !22, file: !21, line: 98, baseType: !16, size: 32)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !22, file: !21, line: 99, baseType: !16, size: 32, offset: 32)
!26 = !DILocation(line: 24, column: 21, scope: !11)
!27 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 25, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 3200, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 50)
!31 = !DILocation(line: 25, column: 19, scope: !11)
!32 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 26, type: !33)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 6400, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 26, column: 19, scope: !11)
!37 = !DILocation(line: 27, column: 11, scope: !38)
!38 = distinct !DILexicalBlock(scope: !11, file: !12, line: 27, column: 5)
!39 = !DILocation(line: 27, column: 9, scope: !38)
!40 = !DILocation(line: 27, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !12, line: 27, column: 5)
!42 = !DILocation(line: 27, column: 18, scope: !41)
!43 = !DILocation(line: 27, column: 5, scope: !38)
!44 = !DILocation(line: 31, column: 16, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !12, line: 28, column: 5)
!46 = !DILocation(line: 31, column: 14, scope: !45)
!47 = !DILocation(line: 32, column: 5, scope: !45)
!48 = !DILocation(line: 27, column: 24, scope: !41)
!49 = !DILocation(line: 27, column: 5, scope: !41)
!50 = distinct !{!50, !43, !51, !52}
!51 = !DILocation(line: 32, column: 5, scope: !38)
!52 = !{!"llvm.loop.mustprogress"}
!53 = !DILocalVariable(name: "source", scope: !54, file: !12, line: 34, type: !33)
!54 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 5)
!55 = !DILocation(line: 34, column: 23, scope: !54)
!56 = !DILocalVariable(name: "i", scope: !57, file: !12, line: 36, type: !58)
!57 = distinct !DILexicalBlock(scope: !54, file: !12, line: 35, column: 9)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !59, line: 46, baseType: !60)
!59 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!60 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!61 = !DILocation(line: 36, column: 20, scope: !57)
!62 = !DILocation(line: 38, column: 20, scope: !63)
!63 = distinct !DILexicalBlock(scope: !57, file: !12, line: 38, column: 13)
!64 = !DILocation(line: 38, column: 18, scope: !63)
!65 = !DILocation(line: 38, column: 25, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !12, line: 38, column: 13)
!67 = !DILocation(line: 38, column: 27, scope: !66)
!68 = !DILocation(line: 38, column: 13, scope: !63)
!69 = !DILocation(line: 40, column: 24, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !12, line: 39, column: 13)
!71 = !DILocation(line: 40, column: 17, scope: !70)
!72 = !DILocation(line: 40, column: 27, scope: !70)
!73 = !DILocation(line: 40, column: 34, scope: !70)
!74 = !DILocation(line: 41, column: 24, scope: !70)
!75 = !DILocation(line: 41, column: 17, scope: !70)
!76 = !DILocation(line: 41, column: 27, scope: !70)
!77 = !DILocation(line: 41, column: 34, scope: !70)
!78 = !DILocation(line: 42, column: 13, scope: !70)
!79 = !DILocation(line: 38, column: 35, scope: !66)
!80 = !DILocation(line: 38, column: 13, scope: !66)
!81 = distinct !{!81, !68, !82, !52}
!82 = !DILocation(line: 42, column: 13, scope: !63)
!83 = !DILocalVariable(name: "i", scope: !84, file: !12, line: 45, type: !58)
!84 = distinct !DILexicalBlock(scope: !54, file: !12, line: 44, column: 9)
!85 = !DILocation(line: 45, column: 20, scope: !84)
!86 = !DILocation(line: 47, column: 20, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !12, line: 47, column: 13)
!88 = !DILocation(line: 47, column: 18, scope: !87)
!89 = !DILocation(line: 47, column: 25, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !12, line: 47, column: 13)
!91 = !DILocation(line: 47, column: 27, scope: !90)
!92 = !DILocation(line: 47, column: 13, scope: !87)
!93 = !DILocation(line: 49, column: 17, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !12, line: 48, column: 13)
!95 = !DILocation(line: 49, column: 22, scope: !94)
!96 = !DILocation(line: 49, column: 34, scope: !94)
!97 = !DILocation(line: 49, column: 27, scope: !94)
!98 = !DILocation(line: 50, column: 13, scope: !94)
!99 = !DILocation(line: 47, column: 35, scope: !90)
!100 = !DILocation(line: 47, column: 13, scope: !90)
!101 = distinct !{!101, !92, !102, !52}
!102 = !DILocation(line: 50, column: 13, scope: !87)
!103 = !DILocation(line: 51, column: 30, scope: !84)
!104 = !DILocation(line: 51, column: 13, scope: !84)
!105 = !DILocation(line: 54, column: 1, scope: !11)
!106 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_17_good", scope: !12, file: !12, line: 95, type: !13, scopeLine: 96, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocation(line: 97, column: 5, scope: !106)
!108 = !DILocation(line: 98, column: 1, scope: !106)
!109 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 110, type: !110, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DISubroutineType(types: !111)
!111 = !{!16, !16, !112}
!112 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !113, size: 64)
!113 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !114, size: 64)
!114 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!115 = !DILocalVariable(name: "argc", arg: 1, scope: !109, file: !12, line: 110, type: !16)
!116 = !DILocation(line: 110, column: 14, scope: !109)
!117 = !DILocalVariable(name: "argv", arg: 2, scope: !109, file: !12, line: 110, type: !112)
!118 = !DILocation(line: 110, column: 27, scope: !109)
!119 = !DILocation(line: 113, column: 22, scope: !109)
!120 = !DILocation(line: 113, column: 12, scope: !109)
!121 = !DILocation(line: 113, column: 5, scope: !109)
!122 = !DILocation(line: 115, column: 5, scope: !109)
!123 = !DILocation(line: 116, column: 5, scope: !109)
!124 = !DILocation(line: 117, column: 5, scope: !109)
!125 = !DILocation(line: 120, column: 5, scope: !109)
!126 = !DILocation(line: 121, column: 5, scope: !109)
!127 = !DILocation(line: 122, column: 5, scope: !109)
!128 = !DILocation(line: 124, column: 5, scope: !109)
!129 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 61, type: !13, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!130 = !DILocalVariable(name: "h", scope: !129, file: !12, line: 63, type: !16)
!131 = !DILocation(line: 63, column: 9, scope: !129)
!132 = !DILocalVariable(name: "data", scope: !129, file: !12, line: 64, type: !19)
!133 = !DILocation(line: 64, column: 21, scope: !129)
!134 = !DILocalVariable(name: "dataBadBuffer", scope: !129, file: !12, line: 65, type: !28)
!135 = !DILocation(line: 65, column: 19, scope: !129)
!136 = !DILocalVariable(name: "dataGoodBuffer", scope: !129, file: !12, line: 66, type: !33)
!137 = !DILocation(line: 66, column: 19, scope: !129)
!138 = !DILocation(line: 67, column: 11, scope: !139)
!139 = distinct !DILexicalBlock(scope: !129, file: !12, line: 67, column: 5)
!140 = !DILocation(line: 67, column: 9, scope: !139)
!141 = !DILocation(line: 67, column: 16, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !12, line: 67, column: 5)
!143 = !DILocation(line: 67, column: 18, scope: !142)
!144 = !DILocation(line: 67, column: 5, scope: !139)
!145 = !DILocation(line: 70, column: 16, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !12, line: 68, column: 5)
!147 = !DILocation(line: 70, column: 14, scope: !146)
!148 = !DILocation(line: 71, column: 5, scope: !146)
!149 = !DILocation(line: 67, column: 24, scope: !142)
!150 = !DILocation(line: 67, column: 5, scope: !142)
!151 = distinct !{!151, !144, !152, !52}
!152 = !DILocation(line: 71, column: 5, scope: !139)
!153 = !DILocalVariable(name: "source", scope: !154, file: !12, line: 73, type: !33)
!154 = distinct !DILexicalBlock(scope: !129, file: !12, line: 72, column: 5)
!155 = !DILocation(line: 73, column: 23, scope: !154)
!156 = !DILocalVariable(name: "i", scope: !157, file: !12, line: 75, type: !58)
!157 = distinct !DILexicalBlock(scope: !154, file: !12, line: 74, column: 9)
!158 = !DILocation(line: 75, column: 20, scope: !157)
!159 = !DILocation(line: 77, column: 20, scope: !160)
!160 = distinct !DILexicalBlock(scope: !157, file: !12, line: 77, column: 13)
!161 = !DILocation(line: 77, column: 18, scope: !160)
!162 = !DILocation(line: 77, column: 25, scope: !163)
!163 = distinct !DILexicalBlock(scope: !160, file: !12, line: 77, column: 13)
!164 = !DILocation(line: 77, column: 27, scope: !163)
!165 = !DILocation(line: 77, column: 13, scope: !160)
!166 = !DILocation(line: 79, column: 24, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !12, line: 78, column: 13)
!168 = !DILocation(line: 79, column: 17, scope: !167)
!169 = !DILocation(line: 79, column: 27, scope: !167)
!170 = !DILocation(line: 79, column: 34, scope: !167)
!171 = !DILocation(line: 80, column: 24, scope: !167)
!172 = !DILocation(line: 80, column: 17, scope: !167)
!173 = !DILocation(line: 80, column: 27, scope: !167)
!174 = !DILocation(line: 80, column: 34, scope: !167)
!175 = !DILocation(line: 81, column: 13, scope: !167)
!176 = !DILocation(line: 77, column: 35, scope: !163)
!177 = !DILocation(line: 77, column: 13, scope: !163)
!178 = distinct !{!178, !165, !179, !52}
!179 = !DILocation(line: 81, column: 13, scope: !160)
!180 = !DILocalVariable(name: "i", scope: !181, file: !12, line: 84, type: !58)
!181 = distinct !DILexicalBlock(scope: !154, file: !12, line: 83, column: 9)
!182 = !DILocation(line: 84, column: 20, scope: !181)
!183 = !DILocation(line: 86, column: 20, scope: !184)
!184 = distinct !DILexicalBlock(scope: !181, file: !12, line: 86, column: 13)
!185 = !DILocation(line: 86, column: 18, scope: !184)
!186 = !DILocation(line: 86, column: 25, scope: !187)
!187 = distinct !DILexicalBlock(scope: !184, file: !12, line: 86, column: 13)
!188 = !DILocation(line: 86, column: 27, scope: !187)
!189 = !DILocation(line: 86, column: 13, scope: !184)
!190 = !DILocation(line: 88, column: 17, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !12, line: 87, column: 13)
!192 = !DILocation(line: 88, column: 22, scope: !191)
!193 = !DILocation(line: 88, column: 34, scope: !191)
!194 = !DILocation(line: 88, column: 27, scope: !191)
!195 = !DILocation(line: 89, column: 13, scope: !191)
!196 = !DILocation(line: 86, column: 35, scope: !187)
!197 = !DILocation(line: 86, column: 13, scope: !187)
!198 = distinct !{!198, !189, !199, !52}
!199 = !DILocation(line: 89, column: 13, scope: !184)
!200 = !DILocation(line: 90, column: 30, scope: !181)
!201 = !DILocation(line: 90, column: 13, scope: !181)
!202 = !DILocation(line: 93, column: 1, scope: !129)
