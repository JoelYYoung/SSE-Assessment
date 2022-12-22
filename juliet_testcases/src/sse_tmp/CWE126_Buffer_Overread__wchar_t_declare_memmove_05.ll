; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_05.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !8
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_memmove_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !36
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #6, !dbg !37
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !40
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #6, !dbg !41
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !42
  store i32 0, i32* %arrayidx3, align 4, !dbg !43
  %0 = load i32, i32* @staticTrue, align 4, !dbg !44
  %tobool = icmp ne i32 %0, 0, !dbg !44
  br i1 %tobool, label %if.then, label %if.end, !dbg !46

if.then:                                          ; preds = %entry
  %arraydecay4 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !47
  store i32* %arraydecay4, i32** %data, align 8, !dbg !49
  br label %if.end, !dbg !50

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !51, metadata !DIExpression()), !dbg !53
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !54
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #6, !dbg !55
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !56
  store i32 0, i32* %arrayidx7, align 4, !dbg !57
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !58
  %1 = bitcast i32* %arraydecay8 to i8*, !dbg !58
  %2 = load i32*, i32** %data, align 8, !dbg !59
  %3 = bitcast i32* %2 to i8*, !dbg !58
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !60
  %call10 = call i64 @wcslen(i32* %arraydecay9) #7, !dbg !61
  %mul = mul i64 %call10, 4, !dbg !62
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %1, i8* align 4 %3, i64 %mul, i1 false), !dbg !58
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !63
  store i32 0, i32* %arrayidx11, align 4, !dbg !64
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !65
  call void @printWLine(i32* %arraydecay12), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_memmove_05_good() #0 !dbg !68 {
entry:
  call void @goodG2B1(), !dbg !69
  call void @goodG2B2(), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !72 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i64 @time(i64* null) #6, !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 %conv) #6, !dbg !84
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !85
  call void @CWE126_Buffer_Overread__wchar_t_declare_memmove_05_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @CWE126_Buffer_Overread__wchar_t_declare_memmove_05_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !92 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !99
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #6, !dbg !100
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !101
  store i32 0, i32* %arrayidx, align 4, !dbg !102
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !103
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #6, !dbg !104
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !105
  store i32 0, i32* %arrayidx3, align 4, !dbg !106
  %0 = load i32, i32* @staticFalse, align 4, !dbg !107
  %tobool = icmp ne i32 %0, 0, !dbg !107
  br i1 %tobool, label %if.then, label %if.else, !dbg !109

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !110
  br label %if.end, !dbg !112

if.else:                                          ; preds = %entry
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !113
  store i32* %arraydecay4, i32** %data, align 8, !dbg !115
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !116, metadata !DIExpression()), !dbg !118
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !119
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #6, !dbg !120
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !121
  store i32 0, i32* %arrayidx7, align 4, !dbg !122
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !123
  %1 = bitcast i32* %arraydecay8 to i8*, !dbg !123
  %2 = load i32*, i32** %data, align 8, !dbg !124
  %3 = bitcast i32* %2 to i8*, !dbg !123
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !125
  %call10 = call i64 @wcslen(i32* %arraydecay9) #7, !dbg !126
  %mul = mul i64 %call10, 4, !dbg !127
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %1, i8* align 4 %3, i64 %mul, i1 false), !dbg !123
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !128
  store i32 0, i32* %arrayidx11, align 4, !dbg !129
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !130
  call void @printWLine(i32* %arraydecay12), !dbg !131
  ret void, !dbg !132
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !133 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !134, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !136, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !138, metadata !DIExpression()), !dbg !139
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !140
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #6, !dbg !141
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !142
  store i32 0, i32* %arrayidx, align 4, !dbg !143
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !144
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #6, !dbg !145
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !146
  store i32 0, i32* %arrayidx3, align 4, !dbg !147
  %0 = load i32, i32* @staticTrue, align 4, !dbg !148
  %tobool = icmp ne i32 %0, 0, !dbg !148
  br i1 %tobool, label %if.then, label %if.end, !dbg !150

if.then:                                          ; preds = %entry
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !151
  store i32* %arraydecay4, i32** %data, align 8, !dbg !153
  br label %if.end, !dbg !154

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !155, metadata !DIExpression()), !dbg !157
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !158
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #6, !dbg !159
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !160
  store i32 0, i32* %arrayidx7, align 4, !dbg !161
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !162
  %1 = bitcast i32* %arraydecay8 to i8*, !dbg !162
  %2 = load i32*, i32** %data, align 8, !dbg !163
  %3 = bitcast i32* %2 to i8*, !dbg !162
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !164
  %call10 = call i64 @wcslen(i32* %arraydecay9) #7, !dbg !165
  %mul = mul i64 %call10, 4, !dbg !166
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %1, i8* align 4 %3, i64 %mul, i1 false), !dbg !162
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !167
  store i32 0, i32* %arrayidx11, align 4, !dbg !168
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !169
  call void @printWLine(i32* %arraydecay12), !dbg !170
  ret void, !dbg !171
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 25, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 26, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_05.c", directory: "/root/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memmove_05_bad", scope: !10, file: !10, line: 30, type: !19, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !24, line: 74, baseType: !11)
!24 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!25 = !DILocation(line: 32, column: 15, scope: !18)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !18, file: !10, line: 33, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 1600, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 50)
!30 = !DILocation(line: 33, column: 13, scope: !18)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !18, file: !10, line: 34, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 3200, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 34, column: 13, scope: !18)
!36 = !DILocation(line: 35, column: 13, scope: !18)
!37 = !DILocation(line: 35, column: 5, scope: !18)
!38 = !DILocation(line: 36, column: 5, scope: !18)
!39 = !DILocation(line: 36, column: 25, scope: !18)
!40 = !DILocation(line: 37, column: 13, scope: !18)
!41 = !DILocation(line: 37, column: 5, scope: !18)
!42 = !DILocation(line: 38, column: 5, scope: !18)
!43 = !DILocation(line: 38, column: 27, scope: !18)
!44 = !DILocation(line: 39, column: 8, scope: !45)
!45 = distinct !DILexicalBlock(scope: !18, file: !10, line: 39, column: 8)
!46 = !DILocation(line: 39, column: 8, scope: !18)
!47 = !DILocation(line: 42, column: 16, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !10, line: 40, column: 5)
!49 = !DILocation(line: 42, column: 14, scope: !48)
!50 = !DILocation(line: 43, column: 5, scope: !48)
!51 = !DILocalVariable(name: "dest", scope: !52, file: !10, line: 45, type: !32)
!52 = distinct !DILexicalBlock(scope: !18, file: !10, line: 44, column: 5)
!53 = !DILocation(line: 45, column: 17, scope: !52)
!54 = !DILocation(line: 46, column: 17, scope: !52)
!55 = !DILocation(line: 46, column: 9, scope: !52)
!56 = !DILocation(line: 47, column: 9, scope: !52)
!57 = !DILocation(line: 47, column: 21, scope: !52)
!58 = !DILocation(line: 50, column: 9, scope: !52)
!59 = !DILocation(line: 50, column: 23, scope: !52)
!60 = !DILocation(line: 50, column: 36, scope: !52)
!61 = !DILocation(line: 50, column: 29, scope: !52)
!62 = !DILocation(line: 50, column: 41, scope: !52)
!63 = !DILocation(line: 51, column: 9, scope: !52)
!64 = !DILocation(line: 51, column: 21, scope: !52)
!65 = !DILocation(line: 52, column: 20, scope: !52)
!66 = !DILocation(line: 52, column: 9, scope: !52)
!67 = !DILocation(line: 54, column: 1, scope: !18)
!68 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memmove_05_good", scope: !10, file: !10, line: 119, type: !19, scopeLine: 120, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!69 = !DILocation(line: 121, column: 5, scope: !68)
!70 = !DILocation(line: 122, column: 5, scope: !68)
!71 = !DILocation(line: 123, column: 1, scope: !68)
!72 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 135, type: !73, scopeLine: 136, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!73 = !DISubroutineType(types: !74)
!74 = !{!11, !11, !75}
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !10, line: 135, type: !11)
!79 = !DILocation(line: 135, column: 14, scope: !72)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !10, line: 135, type: !75)
!81 = !DILocation(line: 135, column: 27, scope: !72)
!82 = !DILocation(line: 138, column: 22, scope: !72)
!83 = !DILocation(line: 138, column: 12, scope: !72)
!84 = !DILocation(line: 138, column: 5, scope: !72)
!85 = !DILocation(line: 140, column: 5, scope: !72)
!86 = !DILocation(line: 141, column: 5, scope: !72)
!87 = !DILocation(line: 142, column: 5, scope: !72)
!88 = !DILocation(line: 145, column: 5, scope: !72)
!89 = !DILocation(line: 146, column: 5, scope: !72)
!90 = !DILocation(line: 147, column: 5, scope: !72)
!91 = !DILocation(line: 149, column: 5, scope: !72)
!92 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 61, type: !19, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!93 = !DILocalVariable(name: "data", scope: !92, file: !10, line: 63, type: !22)
!94 = !DILocation(line: 63, column: 15, scope: !92)
!95 = !DILocalVariable(name: "dataBadBuffer", scope: !92, file: !10, line: 64, type: !27)
!96 = !DILocation(line: 64, column: 13, scope: !92)
!97 = !DILocalVariable(name: "dataGoodBuffer", scope: !92, file: !10, line: 65, type: !32)
!98 = !DILocation(line: 65, column: 13, scope: !92)
!99 = !DILocation(line: 66, column: 13, scope: !92)
!100 = !DILocation(line: 66, column: 5, scope: !92)
!101 = !DILocation(line: 67, column: 5, scope: !92)
!102 = !DILocation(line: 67, column: 25, scope: !92)
!103 = !DILocation(line: 68, column: 13, scope: !92)
!104 = !DILocation(line: 68, column: 5, scope: !92)
!105 = !DILocation(line: 69, column: 5, scope: !92)
!106 = !DILocation(line: 69, column: 27, scope: !92)
!107 = !DILocation(line: 70, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !92, file: !10, line: 70, column: 8)
!109 = !DILocation(line: 70, column: 8, scope: !92)
!110 = !DILocation(line: 73, column: 9, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !10, line: 71, column: 5)
!112 = !DILocation(line: 74, column: 5, scope: !111)
!113 = !DILocation(line: 78, column: 16, scope: !114)
!114 = distinct !DILexicalBlock(scope: !108, file: !10, line: 76, column: 5)
!115 = !DILocation(line: 78, column: 14, scope: !114)
!116 = !DILocalVariable(name: "dest", scope: !117, file: !10, line: 81, type: !32)
!117 = distinct !DILexicalBlock(scope: !92, file: !10, line: 80, column: 5)
!118 = !DILocation(line: 81, column: 17, scope: !117)
!119 = !DILocation(line: 82, column: 17, scope: !117)
!120 = !DILocation(line: 82, column: 9, scope: !117)
!121 = !DILocation(line: 83, column: 9, scope: !117)
!122 = !DILocation(line: 83, column: 21, scope: !117)
!123 = !DILocation(line: 86, column: 9, scope: !117)
!124 = !DILocation(line: 86, column: 23, scope: !117)
!125 = !DILocation(line: 86, column: 36, scope: !117)
!126 = !DILocation(line: 86, column: 29, scope: !117)
!127 = !DILocation(line: 86, column: 41, scope: !117)
!128 = !DILocation(line: 87, column: 9, scope: !117)
!129 = !DILocation(line: 87, column: 21, scope: !117)
!130 = !DILocation(line: 88, column: 20, scope: !117)
!131 = !DILocation(line: 88, column: 9, scope: !117)
!132 = !DILocation(line: 90, column: 1, scope: !92)
!133 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 93, type: !19, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!134 = !DILocalVariable(name: "data", scope: !133, file: !10, line: 95, type: !22)
!135 = !DILocation(line: 95, column: 15, scope: !133)
!136 = !DILocalVariable(name: "dataBadBuffer", scope: !133, file: !10, line: 96, type: !27)
!137 = !DILocation(line: 96, column: 13, scope: !133)
!138 = !DILocalVariable(name: "dataGoodBuffer", scope: !133, file: !10, line: 97, type: !32)
!139 = !DILocation(line: 97, column: 13, scope: !133)
!140 = !DILocation(line: 98, column: 13, scope: !133)
!141 = !DILocation(line: 98, column: 5, scope: !133)
!142 = !DILocation(line: 99, column: 5, scope: !133)
!143 = !DILocation(line: 99, column: 25, scope: !133)
!144 = !DILocation(line: 100, column: 13, scope: !133)
!145 = !DILocation(line: 100, column: 5, scope: !133)
!146 = !DILocation(line: 101, column: 5, scope: !133)
!147 = !DILocation(line: 101, column: 27, scope: !133)
!148 = !DILocation(line: 102, column: 8, scope: !149)
!149 = distinct !DILexicalBlock(scope: !133, file: !10, line: 102, column: 8)
!150 = !DILocation(line: 102, column: 8, scope: !133)
!151 = !DILocation(line: 105, column: 16, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !10, line: 103, column: 5)
!153 = !DILocation(line: 105, column: 14, scope: !152)
!154 = !DILocation(line: 106, column: 5, scope: !152)
!155 = !DILocalVariable(name: "dest", scope: !156, file: !10, line: 108, type: !32)
!156 = distinct !DILexicalBlock(scope: !133, file: !10, line: 107, column: 5)
!157 = !DILocation(line: 108, column: 17, scope: !156)
!158 = !DILocation(line: 109, column: 17, scope: !156)
!159 = !DILocation(line: 109, column: 9, scope: !156)
!160 = !DILocation(line: 110, column: 9, scope: !156)
!161 = !DILocation(line: 110, column: 21, scope: !156)
!162 = !DILocation(line: 113, column: 9, scope: !156)
!163 = !DILocation(line: 113, column: 23, scope: !156)
!164 = !DILocation(line: 113, column: 36, scope: !156)
!165 = !DILocation(line: 113, column: 29, scope: !156)
!166 = !DILocation(line: 113, column: 41, scope: !156)
!167 = !DILocation(line: 114, column: 9, scope: !156)
!168 = !DILocation(line: 114, column: 21, scope: !156)
!169 = !DILocation(line: 115, column: 20, scope: !156)
!170 = !DILocation(line: 115, column: 9, scope: !156)
!171 = !DILocation(line: 117, column: 1, scope: !133)
