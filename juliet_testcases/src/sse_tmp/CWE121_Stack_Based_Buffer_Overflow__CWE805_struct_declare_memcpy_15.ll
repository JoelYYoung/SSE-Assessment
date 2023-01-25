; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_15_bad() #0 !dbg !11 {
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
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !37, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !45
  store i64 0, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !49
  %cmp = icmp ult i64 %0, 100, !dbg !51
  br i1 %cmp, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !55
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !56
  store i32 0, i32* %intOne, align 8, !dbg !57
  %2 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !59
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !60
  store i32 0, i32* %intTwo, align 4, !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !63
  %inc = add i64 %3, 1, !dbg !63
  store i64 %inc, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !68
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !69
  %arraydecay2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !69
  %6 = bitcast %struct._twoIntsStruct* %arraydecay2 to i8*, !dbg !69
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 800, i1 false), !dbg !69
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !70
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 0, !dbg !70
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx3), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_15_good() #0 !dbg !73 {
entry:
  call void @goodG2B1(), !dbg !74
  call void @goodG2B2(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !77 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_15_good(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_15_bad(), !dbg !94
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
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !104
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !106, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i64* %i, metadata !109, metadata !DIExpression()), !dbg !111
  store i64 0, i64* %i, align 8, !dbg !112
  br label %for.cond, !dbg !114

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !115
  %cmp = icmp ult i64 %0, 100, !dbg !117
  br i1 %cmp, label %for.body, label %for.end, !dbg !118

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !119
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !121
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !122
  store i32 0, i32* %intOne, align 8, !dbg !123
  %2 = load i64, i64* %i, align 8, !dbg !124
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !125
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !126
  store i32 0, i32* %intTwo, align 4, !dbg !127
  br label %for.inc, !dbg !128

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !129
  %inc = add i64 %3, 1, !dbg !129
  store i64 %inc, i64* %i, align 8, !dbg !129
  br label %for.cond, !dbg !130, !llvm.loop !131

for.end:                                          ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !133
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !134
  %arraydecay2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !134
  %6 = bitcast %struct._twoIntsStruct* %arraydecay2 to i8*, !dbg !134
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 800, i1 false), !dbg !134
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !135
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 0, !dbg !135
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx3), !dbg !136
  ret void, !dbg !137
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !138 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !139, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !141, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !143, metadata !DIExpression()), !dbg !144
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !145
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !146
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !147, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.declare(metadata i64* %i, metadata !150, metadata !DIExpression()), !dbg !152
  store i64 0, i64* %i, align 8, !dbg !153
  br label %for.cond, !dbg !155

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !156
  %cmp = icmp ult i64 %0, 100, !dbg !158
  br i1 %cmp, label %for.body, label %for.end, !dbg !159

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !160
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !162
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !163
  store i32 0, i32* %intOne, align 8, !dbg !164
  %2 = load i64, i64* %i, align 8, !dbg !165
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !166
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !167
  store i32 0, i32* %intTwo, align 4, !dbg !168
  br label %for.inc, !dbg !169

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !170
  %inc = add i64 %3, 1, !dbg !170
  store i64 %inc, i64* %i, align 8, !dbg !170
  br label %for.cond, !dbg !171, !llvm.loop !172

for.end:                                          ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !174
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !175
  %arraydecay2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !175
  %6 = bitcast %struct._twoIntsStruct* %arraydecay2 to i8*, !dbg !175
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 800, i1 false), !dbg !175
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !176
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 0, !dbg !176
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx3), !dbg !177
  ret void, !dbg !178
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_15_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!35 = !DILocation(line: 31, column: 16, scope: !11)
!36 = !DILocation(line: 31, column: 14, scope: !11)
!37 = !DILocalVariable(name: "source", scope: !38, file: !12, line: 39, type: !31)
!38 = distinct !DILexicalBlock(scope: !11, file: !12, line: 38, column: 5)
!39 = !DILocation(line: 39, column: 23, scope: !38)
!40 = !DILocalVariable(name: "i", scope: !41, file: !12, line: 41, type: !42)
!41 = distinct !DILexicalBlock(scope: !38, file: !12, line: 40, column: 9)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !43, line: 46, baseType: !44)
!43 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 41, column: 20, scope: !41)
!46 = !DILocation(line: 43, column: 20, scope: !47)
!47 = distinct !DILexicalBlock(scope: !41, file: !12, line: 43, column: 13)
!48 = !DILocation(line: 43, column: 18, scope: !47)
!49 = !DILocation(line: 43, column: 25, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !12, line: 43, column: 13)
!51 = !DILocation(line: 43, column: 27, scope: !50)
!52 = !DILocation(line: 43, column: 13, scope: !47)
!53 = !DILocation(line: 45, column: 24, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !12, line: 44, column: 13)
!55 = !DILocation(line: 45, column: 17, scope: !54)
!56 = !DILocation(line: 45, column: 27, scope: !54)
!57 = !DILocation(line: 45, column: 34, scope: !54)
!58 = !DILocation(line: 46, column: 24, scope: !54)
!59 = !DILocation(line: 46, column: 17, scope: !54)
!60 = !DILocation(line: 46, column: 27, scope: !54)
!61 = !DILocation(line: 46, column: 34, scope: !54)
!62 = !DILocation(line: 47, column: 13, scope: !54)
!63 = !DILocation(line: 43, column: 35, scope: !50)
!64 = !DILocation(line: 43, column: 13, scope: !50)
!65 = distinct !{!65, !52, !66, !67}
!66 = !DILocation(line: 47, column: 13, scope: !47)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocation(line: 50, column: 16, scope: !38)
!69 = !DILocation(line: 50, column: 9, scope: !38)
!70 = !DILocation(line: 51, column: 26, scope: !38)
!71 = !DILocation(line: 51, column: 9, scope: !38)
!72 = !DILocation(line: 53, column: 1, scope: !11)
!73 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_15_good", scope: !12, file: !12, line: 127, type: !13, scopeLine: 128, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocation(line: 129, column: 5, scope: !73)
!75 = !DILocation(line: 130, column: 5, scope: !73)
!76 = !DILocation(line: 131, column: 1, scope: !73)
!77 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 143, type: !78, scopeLine: 144, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{!22, !22, !80}
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !12, line: 143, type: !22)
!84 = !DILocation(line: 143, column: 14, scope: !77)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !12, line: 143, type: !80)
!86 = !DILocation(line: 143, column: 27, scope: !77)
!87 = !DILocation(line: 146, column: 22, scope: !77)
!88 = !DILocation(line: 146, column: 12, scope: !77)
!89 = !DILocation(line: 146, column: 5, scope: !77)
!90 = !DILocation(line: 148, column: 5, scope: !77)
!91 = !DILocation(line: 149, column: 5, scope: !77)
!92 = !DILocation(line: 150, column: 5, scope: !77)
!93 = !DILocation(line: 153, column: 5, scope: !77)
!94 = !DILocation(line: 154, column: 5, scope: !77)
!95 = !DILocation(line: 155, column: 5, scope: !77)
!96 = !DILocation(line: 157, column: 5, scope: !77)
!97 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !12, line: 62, type: !16)
!99 = !DILocation(line: 62, column: 21, scope: !97)
!100 = !DILocalVariable(name: "dataBadBuffer", scope: !97, file: !12, line: 63, type: !26)
!101 = !DILocation(line: 63, column: 19, scope: !97)
!102 = !DILocalVariable(name: "dataGoodBuffer", scope: !97, file: !12, line: 64, type: !31)
!103 = !DILocation(line: 64, column: 19, scope: !97)
!104 = !DILocation(line: 73, column: 16, scope: !97)
!105 = !DILocation(line: 73, column: 14, scope: !97)
!106 = !DILocalVariable(name: "source", scope: !107, file: !12, line: 77, type: !31)
!107 = distinct !DILexicalBlock(scope: !97, file: !12, line: 76, column: 5)
!108 = !DILocation(line: 77, column: 23, scope: !107)
!109 = !DILocalVariable(name: "i", scope: !110, file: !12, line: 79, type: !42)
!110 = distinct !DILexicalBlock(scope: !107, file: !12, line: 78, column: 9)
!111 = !DILocation(line: 79, column: 20, scope: !110)
!112 = !DILocation(line: 81, column: 20, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !12, line: 81, column: 13)
!114 = !DILocation(line: 81, column: 18, scope: !113)
!115 = !DILocation(line: 81, column: 25, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !12, line: 81, column: 13)
!117 = !DILocation(line: 81, column: 27, scope: !116)
!118 = !DILocation(line: 81, column: 13, scope: !113)
!119 = !DILocation(line: 83, column: 24, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !12, line: 82, column: 13)
!121 = !DILocation(line: 83, column: 17, scope: !120)
!122 = !DILocation(line: 83, column: 27, scope: !120)
!123 = !DILocation(line: 83, column: 34, scope: !120)
!124 = !DILocation(line: 84, column: 24, scope: !120)
!125 = !DILocation(line: 84, column: 17, scope: !120)
!126 = !DILocation(line: 84, column: 27, scope: !120)
!127 = !DILocation(line: 84, column: 34, scope: !120)
!128 = !DILocation(line: 85, column: 13, scope: !120)
!129 = !DILocation(line: 81, column: 35, scope: !116)
!130 = !DILocation(line: 81, column: 13, scope: !116)
!131 = distinct !{!131, !118, !132, !67}
!132 = !DILocation(line: 85, column: 13, scope: !113)
!133 = !DILocation(line: 88, column: 16, scope: !107)
!134 = !DILocation(line: 88, column: 9, scope: !107)
!135 = !DILocation(line: 89, column: 26, scope: !107)
!136 = !DILocation(line: 89, column: 9, scope: !107)
!137 = !DILocation(line: 91, column: 1, scope: !97)
!138 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 94, type: !13, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!139 = !DILocalVariable(name: "data", scope: !138, file: !12, line: 96, type: !16)
!140 = !DILocation(line: 96, column: 21, scope: !138)
!141 = !DILocalVariable(name: "dataBadBuffer", scope: !138, file: !12, line: 97, type: !26)
!142 = !DILocation(line: 97, column: 19, scope: !138)
!143 = !DILocalVariable(name: "dataGoodBuffer", scope: !138, file: !12, line: 98, type: !31)
!144 = !DILocation(line: 98, column: 19, scope: !138)
!145 = !DILocation(line: 103, column: 16, scope: !138)
!146 = !DILocation(line: 103, column: 14, scope: !138)
!147 = !DILocalVariable(name: "source", scope: !148, file: !12, line: 111, type: !31)
!148 = distinct !DILexicalBlock(scope: !138, file: !12, line: 110, column: 5)
!149 = !DILocation(line: 111, column: 23, scope: !148)
!150 = !DILocalVariable(name: "i", scope: !151, file: !12, line: 113, type: !42)
!151 = distinct !DILexicalBlock(scope: !148, file: !12, line: 112, column: 9)
!152 = !DILocation(line: 113, column: 20, scope: !151)
!153 = !DILocation(line: 115, column: 20, scope: !154)
!154 = distinct !DILexicalBlock(scope: !151, file: !12, line: 115, column: 13)
!155 = !DILocation(line: 115, column: 18, scope: !154)
!156 = !DILocation(line: 115, column: 25, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !12, line: 115, column: 13)
!158 = !DILocation(line: 115, column: 27, scope: !157)
!159 = !DILocation(line: 115, column: 13, scope: !154)
!160 = !DILocation(line: 117, column: 24, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !12, line: 116, column: 13)
!162 = !DILocation(line: 117, column: 17, scope: !161)
!163 = !DILocation(line: 117, column: 27, scope: !161)
!164 = !DILocation(line: 117, column: 34, scope: !161)
!165 = !DILocation(line: 118, column: 24, scope: !161)
!166 = !DILocation(line: 118, column: 17, scope: !161)
!167 = !DILocation(line: 118, column: 27, scope: !161)
!168 = !DILocation(line: 118, column: 34, scope: !161)
!169 = !DILocation(line: 119, column: 13, scope: !161)
!170 = !DILocation(line: 115, column: 35, scope: !157)
!171 = !DILocation(line: 115, column: 13, scope: !157)
!172 = distinct !{!172, !159, !173, !67}
!173 = !DILocation(line: 119, column: 13, scope: !154)
!174 = !DILocation(line: 122, column: 16, scope: !148)
!175 = !DILocation(line: 122, column: 9, scope: !148)
!176 = !DILocation(line: 123, column: 26, scope: !148)
!177 = !DILocation(line: 123, column: 9, scope: !148)
!178 = !DILocation(line: 125, column: 1, scope: !138)
