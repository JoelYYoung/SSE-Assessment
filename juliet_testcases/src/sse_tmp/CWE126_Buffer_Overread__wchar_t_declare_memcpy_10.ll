; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memcpy_10.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memcpy_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalTrue = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external dso_local global i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_10_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !31
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #6, !dbg !32
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !35
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #6, !dbg !36
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !37
  store i32 0, i32* %arrayidx3, align 4, !dbg !38
  %0 = load i32, i32* @globalTrue, align 4, !dbg !39
  %tobool = icmp ne i32 %0, 0, !dbg !39
  br i1 %tobool, label %if.then, label %if.end, !dbg !41

if.then:                                          ; preds = %entry
  %arraydecay4 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !42
  store i32* %arraydecay4, i32** %data, align 8, !dbg !44
  br label %if.end, !dbg !45

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !46, metadata !DIExpression()), !dbg !48
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !49
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #6, !dbg !50
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !51
  store i32 0, i32* %arrayidx7, align 4, !dbg !52
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !53
  %1 = bitcast i32* %arraydecay8 to i8*, !dbg !53
  %2 = load i32*, i32** %data, align 8, !dbg !54
  %3 = bitcast i32* %2 to i8*, !dbg !53
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !55
  %call10 = call i64 @wcslen(i32* %arraydecay9) #7, !dbg !56
  %mul = mul i64 %call10, 4, !dbg !57
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 4 %3, i64 %mul, i1 false), !dbg !53
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !58
  store i32 0, i32* %arrayidx11, align 4, !dbg !59
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !60
  call void @printWLine(i32* %arraydecay12), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_10_good() #0 !dbg !63 {
entry:
  call void @goodG2B1(), !dbg !64
  call void @goodG2B2(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* null) #6, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #6, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_10_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_10_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !87 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !94
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #6, !dbg !95
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !96
  store i32 0, i32* %arrayidx, align 4, !dbg !97
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !98
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #6, !dbg !99
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !100
  store i32 0, i32* %arrayidx3, align 4, !dbg !101
  %0 = load i32, i32* @globalFalse, align 4, !dbg !102
  %tobool = icmp ne i32 %0, 0, !dbg !102
  br i1 %tobool, label %if.then, label %if.else, !dbg !104

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !105
  br label %if.end, !dbg !107

if.else:                                          ; preds = %entry
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !108
  store i32* %arraydecay4, i32** %data, align 8, !dbg !110
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !111, metadata !DIExpression()), !dbg !113
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !114
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #6, !dbg !115
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !116
  store i32 0, i32* %arrayidx7, align 4, !dbg !117
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !118
  %1 = bitcast i32* %arraydecay8 to i8*, !dbg !118
  %2 = load i32*, i32** %data, align 8, !dbg !119
  %3 = bitcast i32* %2 to i8*, !dbg !118
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !120
  %call10 = call i64 @wcslen(i32* %arraydecay9) #7, !dbg !121
  %mul = mul i64 %call10, 4, !dbg !122
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 4 %3, i64 %mul, i1 false), !dbg !118
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !123
  store i32 0, i32* %arrayidx11, align 4, !dbg !124
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !125
  call void @printWLine(i32* %arraydecay12), !dbg !126
  ret void, !dbg !127
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !128 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !129, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !131, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !133, metadata !DIExpression()), !dbg !134
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !135
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #6, !dbg !136
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !137
  store i32 0, i32* %arrayidx, align 4, !dbg !138
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !139
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #6, !dbg !140
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !141
  store i32 0, i32* %arrayidx3, align 4, !dbg !142
  %0 = load i32, i32* @globalTrue, align 4, !dbg !143
  %tobool = icmp ne i32 %0, 0, !dbg !143
  br i1 %tobool, label %if.then, label %if.end, !dbg !145

if.then:                                          ; preds = %entry
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !146
  store i32* %arraydecay4, i32** %data, align 8, !dbg !148
  br label %if.end, !dbg !149

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !150, metadata !DIExpression()), !dbg !152
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !153
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #6, !dbg !154
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !155
  store i32 0, i32* %arrayidx7, align 4, !dbg !156
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !157
  %1 = bitcast i32* %arraydecay8 to i8*, !dbg !157
  %2 = load i32*, i32** %data, align 8, !dbg !158
  %3 = bitcast i32* %2 to i8*, !dbg !157
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !159
  %call10 = call i64 @wcslen(i32* %arraydecay9) #7, !dbg !160
  %mul = mul i64 %call10, 4, !dbg !161
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 4 %3, i64 %mul, i1 false), !dbg !157
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !162
  store i32 0, i32* %arrayidx11, align 4, !dbg !163
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !164
  call void @printWLine(i32* %arraydecay12), !dbg !165
  ret void, !dbg !166
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memcpy_10.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memcpy_10_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memcpy_10.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 50)
!25 = !DILocation(line: 26, column: 13, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 27, column: 13, scope: !11)
!31 = !DILocation(line: 28, column: 13, scope: !11)
!32 = !DILocation(line: 28, column: 5, scope: !11)
!33 = !DILocation(line: 29, column: 5, scope: !11)
!34 = !DILocation(line: 29, column: 25, scope: !11)
!35 = !DILocation(line: 30, column: 13, scope: !11)
!36 = !DILocation(line: 30, column: 5, scope: !11)
!37 = !DILocation(line: 31, column: 5, scope: !11)
!38 = !DILocation(line: 31, column: 27, scope: !11)
!39 = !DILocation(line: 32, column: 8, scope: !40)
!40 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 8)
!41 = !DILocation(line: 32, column: 8, scope: !11)
!42 = !DILocation(line: 35, column: 16, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !12, line: 33, column: 5)
!44 = !DILocation(line: 35, column: 14, scope: !43)
!45 = !DILocation(line: 36, column: 5, scope: !43)
!46 = !DILocalVariable(name: "dest", scope: !47, file: !12, line: 38, type: !27)
!47 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!48 = !DILocation(line: 38, column: 17, scope: !47)
!49 = !DILocation(line: 39, column: 17, scope: !47)
!50 = !DILocation(line: 39, column: 9, scope: !47)
!51 = !DILocation(line: 40, column: 9, scope: !47)
!52 = !DILocation(line: 40, column: 21, scope: !47)
!53 = !DILocation(line: 43, column: 9, scope: !47)
!54 = !DILocation(line: 43, column: 22, scope: !47)
!55 = !DILocation(line: 43, column: 35, scope: !47)
!56 = !DILocation(line: 43, column: 28, scope: !47)
!57 = !DILocation(line: 43, column: 40, scope: !47)
!58 = !DILocation(line: 44, column: 9, scope: !47)
!59 = !DILocation(line: 44, column: 21, scope: !47)
!60 = !DILocation(line: 45, column: 20, scope: !47)
!61 = !DILocation(line: 45, column: 9, scope: !47)
!62 = !DILocation(line: 47, column: 1, scope: !11)
!63 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memcpy_10_good", scope: !12, file: !12, line: 112, type: !13, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 114, column: 5, scope: !63)
!65 = !DILocation(line: 115, column: 5, scope: !63)
!66 = !DILocation(line: 116, column: 1, scope: !63)
!67 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 128, type: !68, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!19, !19, !70}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !12, line: 128, type: !19)
!74 = !DILocation(line: 128, column: 14, scope: !67)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !12, line: 128, type: !70)
!76 = !DILocation(line: 128, column: 27, scope: !67)
!77 = !DILocation(line: 131, column: 22, scope: !67)
!78 = !DILocation(line: 131, column: 12, scope: !67)
!79 = !DILocation(line: 131, column: 5, scope: !67)
!80 = !DILocation(line: 133, column: 5, scope: !67)
!81 = !DILocation(line: 134, column: 5, scope: !67)
!82 = !DILocation(line: 135, column: 5, scope: !67)
!83 = !DILocation(line: 138, column: 5, scope: !67)
!84 = !DILocation(line: 139, column: 5, scope: !67)
!85 = !DILocation(line: 140, column: 5, scope: !67)
!86 = !DILocation(line: 142, column: 5, scope: !67)
!87 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", scope: !87, file: !12, line: 56, type: !16)
!89 = !DILocation(line: 56, column: 15, scope: !87)
!90 = !DILocalVariable(name: "dataBadBuffer", scope: !87, file: !12, line: 57, type: !22)
!91 = !DILocation(line: 57, column: 13, scope: !87)
!92 = !DILocalVariable(name: "dataGoodBuffer", scope: !87, file: !12, line: 58, type: !27)
!93 = !DILocation(line: 58, column: 13, scope: !87)
!94 = !DILocation(line: 59, column: 13, scope: !87)
!95 = !DILocation(line: 59, column: 5, scope: !87)
!96 = !DILocation(line: 60, column: 5, scope: !87)
!97 = !DILocation(line: 60, column: 25, scope: !87)
!98 = !DILocation(line: 61, column: 13, scope: !87)
!99 = !DILocation(line: 61, column: 5, scope: !87)
!100 = !DILocation(line: 62, column: 5, scope: !87)
!101 = !DILocation(line: 62, column: 27, scope: !87)
!102 = !DILocation(line: 63, column: 8, scope: !103)
!103 = distinct !DILexicalBlock(scope: !87, file: !12, line: 63, column: 8)
!104 = !DILocation(line: 63, column: 8, scope: !87)
!105 = !DILocation(line: 66, column: 9, scope: !106)
!106 = distinct !DILexicalBlock(scope: !103, file: !12, line: 64, column: 5)
!107 = !DILocation(line: 67, column: 5, scope: !106)
!108 = !DILocation(line: 71, column: 16, scope: !109)
!109 = distinct !DILexicalBlock(scope: !103, file: !12, line: 69, column: 5)
!110 = !DILocation(line: 71, column: 14, scope: !109)
!111 = !DILocalVariable(name: "dest", scope: !112, file: !12, line: 74, type: !27)
!112 = distinct !DILexicalBlock(scope: !87, file: !12, line: 73, column: 5)
!113 = !DILocation(line: 74, column: 17, scope: !112)
!114 = !DILocation(line: 75, column: 17, scope: !112)
!115 = !DILocation(line: 75, column: 9, scope: !112)
!116 = !DILocation(line: 76, column: 9, scope: !112)
!117 = !DILocation(line: 76, column: 21, scope: !112)
!118 = !DILocation(line: 79, column: 9, scope: !112)
!119 = !DILocation(line: 79, column: 22, scope: !112)
!120 = !DILocation(line: 79, column: 35, scope: !112)
!121 = !DILocation(line: 79, column: 28, scope: !112)
!122 = !DILocation(line: 79, column: 40, scope: !112)
!123 = !DILocation(line: 80, column: 9, scope: !112)
!124 = !DILocation(line: 80, column: 21, scope: !112)
!125 = !DILocation(line: 81, column: 20, scope: !112)
!126 = !DILocation(line: 81, column: 9, scope: !112)
!127 = !DILocation(line: 83, column: 1, scope: !87)
!128 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 86, type: !13, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!129 = !DILocalVariable(name: "data", scope: !128, file: !12, line: 88, type: !16)
!130 = !DILocation(line: 88, column: 15, scope: !128)
!131 = !DILocalVariable(name: "dataBadBuffer", scope: !128, file: !12, line: 89, type: !22)
!132 = !DILocation(line: 89, column: 13, scope: !128)
!133 = !DILocalVariable(name: "dataGoodBuffer", scope: !128, file: !12, line: 90, type: !27)
!134 = !DILocation(line: 90, column: 13, scope: !128)
!135 = !DILocation(line: 91, column: 13, scope: !128)
!136 = !DILocation(line: 91, column: 5, scope: !128)
!137 = !DILocation(line: 92, column: 5, scope: !128)
!138 = !DILocation(line: 92, column: 25, scope: !128)
!139 = !DILocation(line: 93, column: 13, scope: !128)
!140 = !DILocation(line: 93, column: 5, scope: !128)
!141 = !DILocation(line: 94, column: 5, scope: !128)
!142 = !DILocation(line: 94, column: 27, scope: !128)
!143 = !DILocation(line: 95, column: 8, scope: !144)
!144 = distinct !DILexicalBlock(scope: !128, file: !12, line: 95, column: 8)
!145 = !DILocation(line: 95, column: 8, scope: !128)
!146 = !DILocation(line: 98, column: 16, scope: !147)
!147 = distinct !DILexicalBlock(scope: !144, file: !12, line: 96, column: 5)
!148 = !DILocation(line: 98, column: 14, scope: !147)
!149 = !DILocation(line: 99, column: 5, scope: !147)
!150 = !DILocalVariable(name: "dest", scope: !151, file: !12, line: 101, type: !27)
!151 = distinct !DILexicalBlock(scope: !128, file: !12, line: 100, column: 5)
!152 = !DILocation(line: 101, column: 17, scope: !151)
!153 = !DILocation(line: 102, column: 17, scope: !151)
!154 = !DILocation(line: 102, column: 9, scope: !151)
!155 = !DILocation(line: 103, column: 9, scope: !151)
!156 = !DILocation(line: 103, column: 21, scope: !151)
!157 = !DILocation(line: 106, column: 9, scope: !151)
!158 = !DILocation(line: 106, column: 22, scope: !151)
!159 = !DILocation(line: 106, column: 35, scope: !151)
!160 = !DILocation(line: 106, column: 28, scope: !151)
!161 = !DILocation(line: 106, column: 40, scope: !151)
!162 = !DILocation(line: 107, column: 9, scope: !151)
!163 = !DILocation(line: 107, column: 21, scope: !151)
!164 = !DILocation(line: 108, column: 20, scope: !151)
!165 = !DILocation(line: 108, column: 9, scope: !151)
!166 = !DILocation(line: 110, column: 1, scope: !128)
