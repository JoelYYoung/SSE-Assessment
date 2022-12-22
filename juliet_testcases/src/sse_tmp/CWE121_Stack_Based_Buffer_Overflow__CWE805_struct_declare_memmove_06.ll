; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_06.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_06.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_06_bad() #0 !dbg !11 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !15, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !35
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !39, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata i64* %i, metadata !42, metadata !DIExpression()), !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !51
  %cmp = icmp ult i64 %0, 100, !dbg !53
  br i1 %cmp, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !57
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !58
  store i32 0, i32* %intOne, align 8, !dbg !59
  %2 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !61
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !62
  store i32 0, i32* %intTwo, align 4, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %3, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !70
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !71
  %arraydecay2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !71
  %6 = bitcast %struct._twoIntsStruct* %arraydecay2 to i8*, !dbg !71
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 800, i1 false), !dbg !71
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !72
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 0, !dbg !72
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx3), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_06_good() #0 !dbg !75 {
entry:
  call void @goodG2B1(), !dbg !76
  call void @goodG2B2(), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !79 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i64 @time(i64* null) #5, !dbg !89
  %conv = trunc i64 %call to i32, !dbg !90
  call void @srand(i32 %conv) #5, !dbg !91
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_06_good(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_06_bad(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !99 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !106
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !110, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata i64* %i, metadata !113, metadata !DIExpression()), !dbg !115
  store i64 0, i64* %i, align 8, !dbg !116
  br label %for.cond, !dbg !118

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !119
  %cmp = icmp ult i64 %0, 100, !dbg !121
  br i1 %cmp, label %for.body, label %for.end, !dbg !122

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !123
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !125
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !126
  store i32 0, i32* %intOne, align 8, !dbg !127
  %2 = load i64, i64* %i, align 8, !dbg !128
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !129
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !130
  store i32 0, i32* %intTwo, align 4, !dbg !131
  br label %for.inc, !dbg !132

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !133
  %inc = add i64 %3, 1, !dbg !133
  store i64 %inc, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !134, !llvm.loop !135

for.end:                                          ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !137
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !138
  %arraydecay2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !138
  %6 = bitcast %struct._twoIntsStruct* %arraydecay2 to i8*, !dbg !138
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 800, i1 false), !dbg !138
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !139
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 0, !dbg !139
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx3), !dbg !140
  ret void, !dbg !141
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !142 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !143, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !145, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !147, metadata !DIExpression()), !dbg !148
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !149
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !152
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !153, metadata !DIExpression()), !dbg !155
  call void @llvm.dbg.declare(metadata i64* %i, metadata !156, metadata !DIExpression()), !dbg !158
  store i64 0, i64* %i, align 8, !dbg !159
  br label %for.cond, !dbg !161

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !162
  %cmp = icmp ult i64 %0, 100, !dbg !164
  br i1 %cmp, label %for.body, label %for.end, !dbg !165

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !166
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !168
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !169
  store i32 0, i32* %intOne, align 8, !dbg !170
  %2 = load i64, i64* %i, align 8, !dbg !171
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !172
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !173
  store i32 0, i32* %intTwo, align 4, !dbg !174
  br label %for.inc, !dbg !175

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !176
  %inc = add i64 %3, 1, !dbg !176
  store i64 %inc, i64* %i, align 8, !dbg !176
  br label %for.cond, !dbg !177, !llvm.loop !178

for.end:                                          ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !180
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !181
  %arraydecay2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !181
  %6 = bitcast %struct._twoIntsStruct* %arraydecay2 to i8*, !dbg !181
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 800, i1 false), !dbg !181
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !182
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 0, !dbg !182
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx3), !dbg !183
  ret void, !dbg !184
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_06.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_06_bad", scope: !12, file: !12, line: 25, type: !13, scopeLine: 26, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_06.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 27, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !18, line: 100, baseType: !19)
!18 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/root/SSE-Assessment")
!19 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !18, line: 96, size: 64, elements: !20)
!20 = !{!21, !23}
!21 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !19, file: !18, line: 98, baseType: !22, size: 32)
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !19, file: !18, line: 99, baseType: !22, size: 32, offset: 32)
!24 = !DILocation(line: 27, column: 21, scope: !11)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 28, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 50)
!29 = !DILocation(line: 28, column: 19, scope: !11)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 29, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 29, column: 19, scope: !11)
!35 = !DILocation(line: 34, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !37, file: !12, line: 31, column: 5)
!37 = distinct !DILexicalBlock(scope: !11, file: !12, line: 30, column: 8)
!38 = !DILocation(line: 34, column: 14, scope: !36)
!39 = !DILocalVariable(name: "source", scope: !40, file: !12, line: 37, type: !31)
!40 = distinct !DILexicalBlock(scope: !11, file: !12, line: 36, column: 5)
!41 = !DILocation(line: 37, column: 23, scope: !40)
!42 = !DILocalVariable(name: "i", scope: !43, file: !12, line: 39, type: !44)
!43 = distinct !DILexicalBlock(scope: !40, file: !12, line: 38, column: 9)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 46, baseType: !46)
!45 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 39, column: 20, scope: !43)
!48 = !DILocation(line: 41, column: 20, scope: !49)
!49 = distinct !DILexicalBlock(scope: !43, file: !12, line: 41, column: 13)
!50 = !DILocation(line: 41, column: 18, scope: !49)
!51 = !DILocation(line: 41, column: 25, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !12, line: 41, column: 13)
!53 = !DILocation(line: 41, column: 27, scope: !52)
!54 = !DILocation(line: 41, column: 13, scope: !49)
!55 = !DILocation(line: 43, column: 24, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !12, line: 42, column: 13)
!57 = !DILocation(line: 43, column: 17, scope: !56)
!58 = !DILocation(line: 43, column: 27, scope: !56)
!59 = !DILocation(line: 43, column: 34, scope: !56)
!60 = !DILocation(line: 44, column: 24, scope: !56)
!61 = !DILocation(line: 44, column: 17, scope: !56)
!62 = !DILocation(line: 44, column: 27, scope: !56)
!63 = !DILocation(line: 44, column: 34, scope: !56)
!64 = !DILocation(line: 45, column: 13, scope: !56)
!65 = !DILocation(line: 41, column: 35, scope: !52)
!66 = !DILocation(line: 41, column: 13, scope: !52)
!67 = distinct !{!67, !54, !68, !69}
!68 = !DILocation(line: 45, column: 13, scope: !49)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 48, column: 17, scope: !40)
!71 = !DILocation(line: 48, column: 9, scope: !40)
!72 = !DILocation(line: 49, column: 26, scope: !40)
!73 = !DILocation(line: 49, column: 9, scope: !40)
!74 = !DILocation(line: 51, column: 1, scope: !11)
!75 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_06_good", scope: !12, file: !12, line: 118, type: !13, scopeLine: 119, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocation(line: 120, column: 5, scope: !75)
!77 = !DILocation(line: 121, column: 5, scope: !75)
!78 = !DILocation(line: 122, column: 1, scope: !75)
!79 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 134, type: !80, scopeLine: 135, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{!22, !22, !82}
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !12, line: 134, type: !22)
!86 = !DILocation(line: 134, column: 14, scope: !79)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !12, line: 134, type: !82)
!88 = !DILocation(line: 134, column: 27, scope: !79)
!89 = !DILocation(line: 137, column: 22, scope: !79)
!90 = !DILocation(line: 137, column: 12, scope: !79)
!91 = !DILocation(line: 137, column: 5, scope: !79)
!92 = !DILocation(line: 139, column: 5, scope: !79)
!93 = !DILocation(line: 140, column: 5, scope: !79)
!94 = !DILocation(line: 141, column: 5, scope: !79)
!95 = !DILocation(line: 144, column: 5, scope: !79)
!96 = !DILocation(line: 145, column: 5, scope: !79)
!97 = !DILocation(line: 146, column: 5, scope: !79)
!98 = !DILocation(line: 148, column: 5, scope: !79)
!99 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 58, type: !13, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", scope: !99, file: !12, line: 60, type: !16)
!101 = !DILocation(line: 60, column: 21, scope: !99)
!102 = !DILocalVariable(name: "dataBadBuffer", scope: !99, file: !12, line: 61, type: !26)
!103 = !DILocation(line: 61, column: 19, scope: !99)
!104 = !DILocalVariable(name: "dataGoodBuffer", scope: !99, file: !12, line: 62, type: !31)
!105 = !DILocation(line: 62, column: 19, scope: !99)
!106 = !DILocation(line: 71, column: 16, scope: !107)
!107 = distinct !DILexicalBlock(scope: !108, file: !12, line: 69, column: 5)
!108 = distinct !DILexicalBlock(scope: !99, file: !12, line: 63, column: 8)
!109 = !DILocation(line: 71, column: 14, scope: !107)
!110 = !DILocalVariable(name: "source", scope: !111, file: !12, line: 74, type: !31)
!111 = distinct !DILexicalBlock(scope: !99, file: !12, line: 73, column: 5)
!112 = !DILocation(line: 74, column: 23, scope: !111)
!113 = !DILocalVariable(name: "i", scope: !114, file: !12, line: 76, type: !44)
!114 = distinct !DILexicalBlock(scope: !111, file: !12, line: 75, column: 9)
!115 = !DILocation(line: 76, column: 20, scope: !114)
!116 = !DILocation(line: 78, column: 20, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !12, line: 78, column: 13)
!118 = !DILocation(line: 78, column: 18, scope: !117)
!119 = !DILocation(line: 78, column: 25, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !12, line: 78, column: 13)
!121 = !DILocation(line: 78, column: 27, scope: !120)
!122 = !DILocation(line: 78, column: 13, scope: !117)
!123 = !DILocation(line: 80, column: 24, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !12, line: 79, column: 13)
!125 = !DILocation(line: 80, column: 17, scope: !124)
!126 = !DILocation(line: 80, column: 27, scope: !124)
!127 = !DILocation(line: 80, column: 34, scope: !124)
!128 = !DILocation(line: 81, column: 24, scope: !124)
!129 = !DILocation(line: 81, column: 17, scope: !124)
!130 = !DILocation(line: 81, column: 27, scope: !124)
!131 = !DILocation(line: 81, column: 34, scope: !124)
!132 = !DILocation(line: 82, column: 13, scope: !124)
!133 = !DILocation(line: 78, column: 35, scope: !120)
!134 = !DILocation(line: 78, column: 13, scope: !120)
!135 = distinct !{!135, !122, !136, !69}
!136 = !DILocation(line: 82, column: 13, scope: !117)
!137 = !DILocation(line: 85, column: 17, scope: !111)
!138 = !DILocation(line: 85, column: 9, scope: !111)
!139 = !DILocation(line: 86, column: 26, scope: !111)
!140 = !DILocation(line: 86, column: 9, scope: !111)
!141 = !DILocation(line: 88, column: 1, scope: !99)
!142 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 91, type: !13, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!143 = !DILocalVariable(name: "data", scope: !142, file: !12, line: 93, type: !16)
!144 = !DILocation(line: 93, column: 21, scope: !142)
!145 = !DILocalVariable(name: "dataBadBuffer", scope: !142, file: !12, line: 94, type: !26)
!146 = !DILocation(line: 94, column: 19, scope: !142)
!147 = !DILocalVariable(name: "dataGoodBuffer", scope: !142, file: !12, line: 95, type: !31)
!148 = !DILocation(line: 95, column: 19, scope: !142)
!149 = !DILocation(line: 99, column: 16, scope: !150)
!150 = distinct !DILexicalBlock(scope: !151, file: !12, line: 97, column: 5)
!151 = distinct !DILexicalBlock(scope: !142, file: !12, line: 96, column: 8)
!152 = !DILocation(line: 99, column: 14, scope: !150)
!153 = !DILocalVariable(name: "source", scope: !154, file: !12, line: 102, type: !31)
!154 = distinct !DILexicalBlock(scope: !142, file: !12, line: 101, column: 5)
!155 = !DILocation(line: 102, column: 23, scope: !154)
!156 = !DILocalVariable(name: "i", scope: !157, file: !12, line: 104, type: !44)
!157 = distinct !DILexicalBlock(scope: !154, file: !12, line: 103, column: 9)
!158 = !DILocation(line: 104, column: 20, scope: !157)
!159 = !DILocation(line: 106, column: 20, scope: !160)
!160 = distinct !DILexicalBlock(scope: !157, file: !12, line: 106, column: 13)
!161 = !DILocation(line: 106, column: 18, scope: !160)
!162 = !DILocation(line: 106, column: 25, scope: !163)
!163 = distinct !DILexicalBlock(scope: !160, file: !12, line: 106, column: 13)
!164 = !DILocation(line: 106, column: 27, scope: !163)
!165 = !DILocation(line: 106, column: 13, scope: !160)
!166 = !DILocation(line: 108, column: 24, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !12, line: 107, column: 13)
!168 = !DILocation(line: 108, column: 17, scope: !167)
!169 = !DILocation(line: 108, column: 27, scope: !167)
!170 = !DILocation(line: 108, column: 34, scope: !167)
!171 = !DILocation(line: 109, column: 24, scope: !167)
!172 = !DILocation(line: 109, column: 17, scope: !167)
!173 = !DILocation(line: 109, column: 27, scope: !167)
!174 = !DILocation(line: 109, column: 34, scope: !167)
!175 = !DILocation(line: 110, column: 13, scope: !167)
!176 = !DILocation(line: 106, column: 35, scope: !163)
!177 = !DILocation(line: 106, column: 13, scope: !163)
!178 = distinct !{!178, !165, !179, !69}
!179 = !DILocation(line: 110, column: 13, scope: !160)
!180 = !DILocation(line: 113, column: 17, scope: !154)
!181 = !DILocation(line: 113, column: 9, scope: !154)
!182 = !DILocation(line: 114, column: 26, scope: !154)
!183 = !DILocation(line: 114, column: 9, scope: !154)
!184 = !DILocation(line: 116, column: 1, scope: !142)
